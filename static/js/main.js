document.addEventListener('DOMContentLoaded', () => {
    // Set up theme toggle functionality
    const themeToggle = document.getElementById('themeToggle');
    
    // Check if user has previously set a theme preference
    const savedTheme = localStorage.getItem('theme');
    if (savedTheme === 'light') {
        document.body.classList.add('light-theme');
        themeToggle.innerHTML = '<i class="fas fa-moon"></i>';
    } else {
        themeToggle.innerHTML = '<i class="fas fa-sun"></i>';
    }
    
    // Toggle theme when button is clicked
    themeToggle.addEventListener('click', () => {
        document.body.classList.toggle('light-theme');
        
        // Save preference to local storage
        if (document.body.classList.contains('light-theme')) {
            localStorage.setItem('theme', 'light');
            themeToggle.innerHTML = '<i class="fas fa-moon"></i>';
        } else {
            localStorage.setItem('theme', 'dark');
            themeToggle.innerHTML = '<i class="fas fa-sun"></i>';
        }
    });
    
    // Sidebar functionality
    const sidebarToggle = document.getElementById('sidebarToggle');
    const sidebar = document.getElementById('chatSidebar');
    const newChatBtn = document.getElementById('newChatBtn');
    const chatList = document.getElementById('chatList');
    const closeSidebarBtn = document.getElementById('closeSidebarBtn');
    
    // Check if sidebar was previously open
    const sidebarState = localStorage.getItem('sidebarOpen');
    if (sidebarState === 'true') {
        document.body.classList.add('sidebar-open');
        sidebar.classList.remove('sidebar-hidden');
    } else {
        sidebar.classList.add('sidebar-hidden');
    }
    
    // Toggle sidebar when button is clicked
    sidebarToggle.addEventListener('click', () => {
        document.body.classList.toggle('sidebar-open');
        sidebar.classList.toggle('sidebar-hidden');
        
        // Save preference to local storage
        localStorage.setItem('sidebarOpen', document.body.classList.contains('sidebar-open'));
    });
    
    // Close sidebar when close button is clicked
    closeSidebarBtn.addEventListener('click', () => {
        document.body.classList.remove('sidebar-open');
        sidebar.classList.add('sidebar-hidden');
        
        // Save preference to local storage
        localStorage.setItem('sidebarOpen', 'false');
    });
    
    // Dialog functionality
    const renameDialog = document.getElementById('renameDialog');
    const newChatNameInput = document.getElementById('newChatName');
    const confirmRenameBtn = document.getElementById('confirmRename');
    const cancelRenameBtn = document.getElementById('cancelRename');
    let currentChatToRename = null;
    
    function openRenameDialog(chatId, currentName) {
        renameDialog.classList.add('active');
        newChatNameInput.value = currentName;
        currentChatToRename = chatId;
        newChatNameInput.focus();
    }
    
    function closeRenameDialog() {
        renameDialog.classList.remove('active');
        currentChatToRename = null;
    }
    
    cancelRenameBtn.addEventListener('click', closeRenameDialog);
    
    confirmRenameBtn.addEventListener('click', () => {
        const newName = newChatNameInput.value.trim();
        if (newName && currentChatToRename) {
            renameChat(currentChatToRename, newName);
            closeRenameDialog();
        }
    });
    
    // Close dialog when clicking outside
    renameDialog.addEventListener('click', (e) => {
        if (e.target === renameDialog) {
            closeRenameDialog();
        }
    });
    
    // Enter key in rename input
    newChatNameInput.addEventListener('keypress', (e) => {
        if (e.key === 'Enter') {
            confirmRenameBtn.click();
        }
    });
    
    // Add a helper function to clean potentially malformed JSON responses
    function cleanJsonResponse(jsonText) {
        if (typeof jsonText !== 'string') {
            return jsonText; // Already parsed or not a string
        }
        
        console.log("Cleaning JSON response...");
        
        // Fix common JSON issues
        
        // Fix trailing commas in arrays
        jsonText = jsonText.replace(/,\s*]/g, ']');
        
        // Fix trailing commas in objects
        jsonText = jsonText.replace(/,\s*}/g, '}');
        
        // Fix trailing commas before closing brackets with possible newlines
        jsonText = jsonText.replace(/,(\s*[\r\n]\s*)([\]}])/g, '$1$2');
        
        // Additional check for any trailing commas - this is a more comprehensive check
        try {
            JSON.parse(jsonText);
            console.log("JSON parsed successfully without cleaning");
            return jsonText;
        } catch (e) {
            console.log("JSON parse failed, attempting more aggressive cleaning", e);
            
            // More aggressive cleaning for trailing commas
            // This handles complex multi-line JSON with potential trailing commas
            const lines = jsonText.split('\n');
            for (let i = 0; i < lines.length; i++) {
                const nextLine = (i < lines.length - 1) ? lines[i + 1].trim() : '';
                if (lines[i].trim().endsWith(',') && (nextLine.startsWith(']') || nextLine.startsWith('}'))) {
                    lines[i] = lines[i].trimRight().slice(0, -1);
                    console.log(`Fixed trailing comma on line ${i}`);
                }
            }
            
            return lines.join('\n');
        }
    }

    async function fetchChats() {
        try {
            console.log("Fetching chats...");
            const response = await fetch('/api/chats');
            
            if (!response.ok) {
                throw new Error(`Failed to fetch chats: ${response.status} ${response.statusText}`);
            }
            
            // Get response text and clean it
            const responseText = await response.text();
            console.log("Raw API response:", responseText);
            
            // Clean the response text
            const cleanedJson = cleanJsonResponse(responseText);
            console.log("Cleaned API response:", cleanedJson);
            
            // Parse the cleaned JSON
            const data = JSON.parse(cleanedJson);
            console.log("Chats fetched and parsed:", data);
            
            // Get the chats list from the response (handle both formats)
            let chats = [];
            if (data.success && data.chats) {
                console.log("Received chats in success/chats format");
                chats = data.chats;
            } else if (Array.isArray(data)) {
                console.log("Received chats as direct array");
                chats = data;
            } else if (data.chats && Array.isArray(data.chats)) {
                console.log("Received chats in chats property without success flag");
                chats = data.chats;
            } else {
                console.error("Unexpected API response format:", data);
                chats = [];
            }
            
            console.log(`Processing ${chats.length} chats`);
            
            // Get the chat list container - UPDATED TO MATCH HTML STRUCTURE
            const chatsList = document.getElementById('chatList');
            if (!chatsList) {
                console.error("Could not find chatList element in the DOM");
                return;
            }
            
            // Check for empty chats message and remove it if it exists
            const emptyChatsMessage = chatsList.querySelector('.empty-chats-message');
            if (emptyChatsMessage) {
                emptyChatsMessage.remove();
            }
            
            // Clear existing chats
            chatsList.innerHTML = ''; 
            
            // Get active chat ID from localStorage
            const activeChatId = localStorage.getItem('activeChatId');
            console.log(`Active chat ID from localStorage: ${activeChatId}`);
            
            if (chats && chats.length > 0) {
                console.log(`Adding ${chats.length} chats to sidebar`);
                
                // Separate pinned and unpinned chats
                const pinnedChats = chats.filter(chat => chat.is_pinned);
                const unpinnedChats = chats.filter(chat => !chat.is_pinned);
                
                console.log(`Found ${pinnedChats.length} pinned chats and ${unpinnedChats.length} unpinned chats`);
                
                // Sort chats by updated_at (newest first)
                const sortByNewest = (a, b) => {
                    const dateA = new Date(a.updated_at || 0);
                    const dateB = new Date(b.updated_at || 0);
                    return dateB - dateA;
                };
                
                pinnedChats.sort(sortByNewest);
                unpinnedChats.sort(sortByNewest);
                
                // Add a "Pinned" separator if there are pinned chats
                if (pinnedChats.length > 0) {
                    const pinnedSeparator = document.createElement('div');
                    pinnedSeparator.className = 'pinned-separator';
                    pinnedSeparator.textContent = 'Pinned conversations';
                    chatsList.appendChild(pinnedSeparator);
                    
                    // Add pinned chats
                    pinnedChats.forEach(chat => {
                        try {
                            console.log(`Adding pinned chat to sidebar: ${chat.chat_id}, ${chat.chat_name}`);
                            // Check if this chat should be marked active
                            chat.is_active = (chat.chat_id === activeChatId);
                            
                            // Add this chat to the sidebar
                            addChatToSidebar(chat);
                        } catch (err) {
                            console.error(`Error adding pinned chat ${chat.chat_id} to sidebar:`, err);
                        }
                    });
                }
                
                // Add a separator for other chats if both pinned and unpinned chats exist
                if (pinnedChats.length > 0 && unpinnedChats.length > 0) {
                    const otherSeparator = document.createElement('div');
                    otherSeparator.className = 'pinned-separator';
                    otherSeparator.textContent = 'Other conversations';
                    chatsList.appendChild(otherSeparator);
                }
                
                // Add unpinned chats
                unpinnedChats.forEach(chat => {
                    try {
                        console.log(`Adding unpinned chat to sidebar: ${chat.chat_id}, ${chat.chat_name}`);
                        // Check if this chat should be marked active
                        chat.is_active = (chat.chat_id === activeChatId);
                        
                        // Add this chat to the sidebar
                        addChatToSidebar(chat);
                    } catch (err) {
                        console.error(`Error adding unpinned chat ${chat.chat_id} to sidebar:`, err);
                    }
                });
            } else {
                console.log("No chats returned from API");
                
                // Show empty state
                const emptyState = document.createElement('div');
                emptyState.className = 'empty-chats-message';
                emptyState.textContent = 'No conversations yet';
                chatsList.appendChild(emptyState);
            }
            
            return chats;
        } catch (error) {
            console.error('Error fetching chats:', error);
            
            // Show error state in sidebar
            const chatsList = document.getElementById('chatList');
            if (chatsList) {
                chatsList.innerHTML = '';
                const errorState = document.createElement('div');
                errorState.className = 'empty-chats-message';
                errorState.textContent = 'Could not load conversations. Please try again.';
                chatsList.appendChild(errorState);
            }
            
            return [];
        }
    }
    
    // Function to create a new chat
    async function createNewChat() {
        try {
            console.log("Creating new chat...");
            
            // Make API call to create a new chat
            const response = await fetch('/api/chats/create', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({
                    chat_name: 'New Chat'
                })
            });
            
            if (!response.ok) {
                throw new Error(`Failed to create new chat: ${response.status} ${response.statusText}`);
            }
            
            // Parse response
            const data = await response.json();
            console.log("New chat created:", data);
            
            if (data.success && data.chat_id) {
                console.log(`New chat created with ID: ${data.chat_id}`);
                
                // Store the new chat ID in localStorage
                localStorage.setItem('activeChatId', data.chat_id);
                
                // Create a new chat object
                const newChat = {
                    chat_id: data.chat_id,
                    chat_name: 'New Chat',
                    is_active: true,
                    created_at: new Date().toISOString(),
                    updated_at: new Date().toISOString()
                };
                
                // Clear the messages container
                const messagesContainer = document.getElementById('messages-container');
                if (messagesContainer) {
                    messagesContainer.innerHTML = '';
                    
                    // Add welcome message
                    const welcomeMessage = document.createElement('div');
                    welcomeMessage.className = 'message system-message';
                    welcomeMessage.textContent = 'How can I help you today?';
                    messagesContainer.appendChild(welcomeMessage);
                }
                
                // Hide any no-chat selected message
                const noChatSelectedMsg = document.querySelector('.no-chat-selected');
                if (noChatSelectedMsg) {
                    noChatSelectedMsg.style.display = 'none';
                }
                
                // Show the chat interface
                const chatInterface = document.querySelector('.chat-interface');
                if (chatInterface) {
                    chatInterface.style.display = 'flex';
                }
                
                // Add the new chat to the sidebar
                console.log("Calling addChatToSidebar for new chat");
                addChatToSidebar(newChat);
                
                // Also refresh the full chat list to ensure everything is in sync
                console.log("Refreshing chat list");
                await fetchChats();
                
                // Mark all chats as inactive except the new one
                const chatItems = document.querySelectorAll('.chat-item');
                chatItems.forEach(item => {
                    if (item.dataset.chatId === data.chat_id) {
                        item.classList.add('active');
                    } else {
                        item.classList.remove('active');
                    }
                });
                
                return true;
            } else {
                console.error("Failed to create new chat, invalid response:", data);
                return false;
            }
        } catch (error) {
            console.error('Error creating new chat:', error);
            
            // Display error notification
            showNotification('Failed to create new chat. Please try again.', 'error');
            return false;
        }
    }
    
    async function selectChat(chatId) {
        try {
            console.log(`Selecting chat: ${chatId}`);
            
            // First, update the UI to show this chat as selected
            const chatItems = document.querySelectorAll('.chat-item');
            chatItems.forEach(item => {
                if (item.dataset.chatId === chatId) {
                    item.classList.add('active');
                } else {
                    item.classList.remove('active');
                }
            });
            
            // Set this as the active chat in localStorage
            localStorage.setItem('activeChatId', chatId);
            
            // If it's a new chat, we don't need to fetch messages
            if (!document.querySelector(`.chat-item[data-chat-id="${chatId}"]`)) {
                console.log("This appears to be a new chat, skipping message fetch");
                
                // Clear the messages container
                const messagesContainer = document.getElementById('messages');
                messagesContainer.innerHTML = '';
                
                // Add a welcome message
                const welcomeMessage = document.createElement('div');
                welcomeMessage.className = 'message assistant-message markdown-content';
                welcomeMessage.innerHTML = marked.parse("Hello! I'm Nicc AI, your ADAS calibration assistant. How can I help you today?");
                messagesContainer.appendChild(welcomeMessage);
                
                return;
            }
            
            // Fetch chat messages from the API
            const response = await fetch(`/api/chats/${chatId}`);
            
            if (!response.ok) {
                throw new Error('Failed to fetch chat messages');
            }
            
            const data = await response.json();
            console.log("Retrieved messages:", data);
            
            if (data.success) {
                // Clear the messages container
                const messagesContainer = document.getElementById('messages');
                messagesContainer.innerHTML = '';
                
                // Add each message to the UI
                if (data.messages && data.messages.length > 0) {
                    data.messages.forEach(msg => {
                        const messageDiv = document.createElement('div');
                        messageDiv.className = `message ${msg.role === 'user' ? 'user-message' : 'assistant-message'}`;
                        
                        if (msg.role === 'assistant') {
                            messageDiv.classList.add('markdown-content');
                            messageDiv.innerHTML = marked.parse(msg.content);
                        } else {
                            messageDiv.textContent = msg.content;
                        }
                        
                        messagesContainer.appendChild(messageDiv);
                    });
                    
                    // Scroll to the bottom of the messages
                    messagesContainer.scrollTop = messagesContainer.scrollHeight;
                } else {
                    // No messages, add a welcome message
                    const welcomeMessage = document.createElement('div');
                    welcomeMessage.className = 'message assistant-message markdown-content';
                    welcomeMessage.innerHTML = marked.parse("Hello! I'm Nicc AI, your ADAS calibration assistant. How can I help you today?");
                    messagesContainer.appendChild(welcomeMessage);
                }
            } else {
                console.error('Error retrieving chat messages:', data.error);
            }
        } catch (error) {
            console.error('Error selecting chat:', error);
        }
    }
    
    async function renameChat(chatId, newName) {
        try {
            const response = await fetch(`/api/chats/${chatId}/rename`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ name: newName })
            });
            
            if (!response.ok) {
                throw new Error('Failed to rename chat');
            }
            
            const data = await response.json();
            if (data.success) {
                // Update chat name in list
                const chatItem = document.querySelector(`.chat-item[data-chat-id="${chatId}"]`);
                if (chatItem) {
                    const nameElement = chatItem.querySelector('.chat-item-name');
                    if (nameElement) {
                        nameElement.textContent = newName;
                    }
                }
            }
        } catch (error) {
            console.error('Error renaming chat:', error);
        }
    }
    
    async function deleteChat(chatId) {
        if (!confirm('Delete this conversation? This action cannot be undone.')) {
            return;
        }
        
        try {
            const response = await fetch(`/api/chats/${chatId}/delete`, {
                method: 'DELETE'
            });
            
            if (!response.ok) {
                throw new Error('Failed to delete chat');
            }
            
            const data = await response.json();
            if (data.success) {
                // Remove chat from list
                const chatItem = document.querySelector(`.chat-item[data-chat-id="${chatId}"]`);
                if (chatItem) {
                    chatItem.remove();
                }
                
                // Check if there are any remaining chats
                const remainingChats = document.querySelectorAll('.chat-item').length;
                
                if (remainingChats === 0) {
                    // Only create a new chat if there are no chats left AND this was the active chat
                    const activeId = localStorage.getItem('activeChatId');
                    if (activeId === chatId) {
                        console.log('No chats left and active chat was deleted, creating new one');
                        createNewChat();
                    }
                } else {
                    // If there are remaining chats, select the first one
                    const firstChatItem = document.querySelector('.chat-item');
                    if (firstChatItem) {
                        console.log('Selecting first available chat');
                        selectChat(firstChatItem.dataset.chatId);
                    }
                }
                
                // Update empty state
                updateEmptyState();
            }
        } catch (error) {
            console.error('Error deleting chat:', error);
        }
    }
    
    // Function to toggle pin status of a chat
    async function togglePinChat(chatId) {
        try {
            console.log(`Toggling pin status for chat: ${chatId}`);
            
            // Get the chat item
            const chatItem = document.querySelector(`.chat-item[data-id="${chatId}"]`);
            if (!chatItem) {
                console.error(`Could not find chat item with ID: ${chatId}`);
                return;
            }
            
            // Current pinned state
            const isPinned = chatItem.classList.contains('pinned');
            console.log(`Current pinned status: ${isPinned}, will be set to: ${!isPinned}`);
            
            // Call the backend API to update the pinned status
            const response = await fetch(`/api/chats/${chatId}/toggle-pin`, {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                }
            });
            
            if (!response.ok) {
                throw new Error(`Failed to toggle pin status: ${response.status} ${response.statusText}`);
            }
            
            const data = await response.json();
            console.log('Pin toggle response:', data);
            
            if (data.success) {
                // Update the UI based on the new pinned state
                if (data.is_pinned) {
                    chatItem.classList.add('pinned');
                    const pinBtn = chatItem.querySelector('.chat-action-btn.pin-btn');
                    if (pinBtn) {
                        pinBtn.classList.add('pinned');
                        pinBtn.querySelector('i').className = 'fas fa-thumbtack';
                        pinBtn.title = 'Unpin chat';
                    }
                } else {
                    chatItem.classList.remove('pinned');
                    const pinBtn = chatItem.querySelector('.chat-action-btn.pin-btn');
                    if (pinBtn) {
                        pinBtn.classList.remove('pinned');
                        pinBtn.querySelector('i').className = 'fas fa-thumbtack';
                        pinBtn.title = 'Pin chat';
                    }
                }
                
                // Refresh the chat list to update the order
                await fetchChats();
                
                // Update the pinned separator visibility
                updatePinnedSeparator();
            } else {
                console.error('Error toggling pin status:', data.error);
            }
        } catch (error) {
            console.error('Error toggling pin status:', error);
        }
    }
    
    // Update the pinned separator visibility
    function updatePinnedSeparator() {
        console.log("Updating pinned separator visibility");
        const chatList = document.getElementById('chatList');
        if (!chatList) {
            console.error("Could not find chatList element");
            return;
        }
        
        // Remove any existing separators
        const existingSeparators = chatList.querySelectorAll('.pinned-separator');
        existingSeparators.forEach(separator => separator.remove());
        
        // Get all chats and check if we have any pinned chats
        const pinnedChats = chatList.querySelectorAll('.chat-item.pinned');
        const unpinnedChats = chatList.querySelectorAll('.chat-item:not(.pinned)');
        
        console.log(`Found ${pinnedChats.length} pinned chats and ${unpinnedChats.length} unpinned chats`);
        
        // If we have pinned chats, add separators
        if (pinnedChats.length > 0) {
            // Create "Pinned conversations" separator
            const pinnedSeparator = document.createElement('div');
            pinnedSeparator.className = 'pinned-separator';
            pinnedSeparator.textContent = 'Pinned conversations';
            
            // Add it at the top of the list
            if (chatList.firstChild) {
                chatList.insertBefore(pinnedSeparator, chatList.firstChild);
            } else {
                chatList.appendChild(pinnedSeparator);
            }
            
            // If we also have unpinned chats, add "Other conversations" separator
            if (unpinnedChats.length > 0) {
                // Create "Other conversations" separator
                const otherSeparator = document.createElement('div');
                otherSeparator.className = 'pinned-separator';
                otherSeparator.textContent = 'Other conversations';
                
                // Find first unpinned chat to insert before
                const firstUnpinned = chatList.querySelector('.chat-item:not(.pinned)');
                if (firstUnpinned) {
                    chatList.insertBefore(otherSeparator, firstUnpinned);
                }
            }
            
            // Add has-pinned class to the chat list
            chatList.classList.add('has-pinned');
        } else {
            // No pinned chats, remove the has-pinned class
            chatList.classList.remove('has-pinned');
        }
    }
    
    // Render chat list
    function renderChatList(chats) {
        chatList.innerHTML = '';
        
        if (chats.length === 0) {
            const emptyMessage = document.createElement('div');
            emptyMessage.className = 'empty-chats-message';
            emptyMessage.textContent = 'No conversations yet';
            chatList.appendChild(emptyMessage);
            return;
        }
        
        // Add pinned separator
        const separator = document.createElement('div');
        separator.className = 'pinned-separator';
        separator.textContent = 'Other conversations';
        chatList.appendChild(separator);
        
        // Get pinned chats from localStorage
        const pinnedChats = JSON.parse(localStorage.getItem('pinnedChats') || '[]');
        
        chats.forEach(chat => {
            const chatItem = document.createElement('div');
            chatItem.className = 'chat-item';
            chatItem.dataset.chatId = chat.chat_id;
            
            // Check if chat is pinned
            if (pinnedChats.includes(chat.chat_id)) {
                chatItem.classList.add('pinned');
            }
            
            // Format date
            const chatDate = new Date(chat.updated_at);
            const today = new Date();
            let dateText;
            
            if (chatDate.toDateString() === today.toDateString()) {
                // Today - show time
                dateText = chatDate.toLocaleTimeString([], { hour: '2-digit', minute: '2-digit' });
            } else if (chatDate.getFullYear() === today.getFullYear()) {
                // This year - show month and day
                dateText = chatDate.toLocaleDateString([], { month: 'short', day: 'numeric' });
            } else {
                // Different year - show date with year
                dateText = chatDate.toLocaleDateString([], { month: 'short', day: 'numeric', year: 'numeric' });
            }
            
            chatItem.innerHTML = `
                <div class="chat-item-content">
                    <i class="fas fa-comment-alt chat-item-icon"></i>
                    <div>
                        <div class="chat-item-name">${chat.chat_name}</div>
                        <div class="chat-item-time">${dateText}</div>
                    </div>
                </div>
                <div class="chat-item-actions">
                    <button class="chat-action-btn pin-btn" title="Pin chat">
                        <i class="fas fa-thumbtack"></i>
                    </button>
                    <button class="chat-action-btn rename-btn" title="Rename">
                        <i class="fas fa-edit"></i>
                    </button>
                    <button class="chat-action-btn delete-btn" title="Delete">
                        <i class="fas fa-trash"></i>
                    </button>
                </div>
            `;
            
            // Add click handlers
            chatItem.addEventListener('click', (e) => {
                // If not clicking on an action button
                if (!e.target.closest('.chat-action-btn')) {
                    selectChat(chat.chat_id);
                }
            });
            
            const pinBtn = chatItem.querySelector('.pin-btn');
            pinBtn.addEventListener('click', (e) => {
                e.stopPropagation();
                togglePinChat(chat.chat_id);
            });
            
            const renameBtn = chatItem.querySelector('.rename-btn');
            renameBtn.addEventListener('click', (e) => {
                e.stopPropagation();
                openRenameDialog(chat.chat_id, chat.chat_name);
            });
            
            const deleteBtn = chatItem.querySelector('.delete-btn');
            deleteBtn.addEventListener('click', (e) => {
                e.stopPropagation();
                deleteChat(chat.chat_id);
            });
            
            chatList.appendChild(chatItem);
        });
        
        // Mark the active chat
        const activeChatId = localStorage.getItem('activeChatId');
        if (activeChatId) {
            const activeChat = document.querySelector(`.chat-item[data-chat-id="${activeChatId}"]`);
            if (activeChat) {
                activeChat.classList.add('active');
            }
        }
        
        // Update pinned separator visibility
        updatePinnedSeparator();
    }
    
    function updateEmptyState() {
        const hasChats = document.querySelectorAll('.chat-item').length > 0;
        const emptyMessage = document.querySelector('.empty-chats-message');
        
        // Clear current messages area
        const messagesContainer = document.getElementById('messages');
        if (messagesContainer) {
            messagesContainer.innerHTML = '';
        }
        
        if (!hasChats && !emptyMessage) {
            const newEmptyMessage = document.createElement('div');
            newEmptyMessage.className = 'empty-chats-message';
            newEmptyMessage.innerHTML = '<p>No conversations yet</p><p>Click "New Chat" to start a conversation with NICC</p>';
            chatList.appendChild(newEmptyMessage);
            
            // Also add a welcome message to the main chat area
            if (messagesContainer) {
                const welcomeMessage = document.createElement('div');
                welcomeMessage.className = 'message assistant-message welcome-message';
                welcomeMessage.innerHTML = '<h2>Welcome to NICC</h2><p>Click the "New Chat" button in the sidebar to start a new conversation.</p>';
                messagesContainer.appendChild(welcomeMessage);
            }
        } else if (hasChats && emptyMessage) {
            emptyMessage.remove();
        }
    }
    
    // Event listener for new chat button
    newChatBtn.addEventListener('click', createNewChat);
    
    // Event listener for cleanup button
    const cleanupChatsBtn = document.getElementById('cleanupChatsBtn');
    if (cleanupChatsBtn) {
        cleanupChatsBtn.addEventListener('click', cleanupChats);
    }
    
    // Function to clean up old chats
    async function cleanupChats() {
        if (!confirm('This will delete all but your 5 most recent conversations, excluding any pinned conversations which will be preserved. This action cannot be undone. Continue?')) {
            return;
        }
        
        try {
            const response = await fetch('/api/chats/cleanup', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ keep_recent: 5 })
            });
            
            if (!response.ok) {
                throw new Error('Failed to clean up chats');
            }
            
            const data = await response.json();
            if (data.success) {
                const pinnedMsg = data.pinned_count ? ` (${data.pinned_count} pinned chats preserved)` : '';
                alert(`Cleanup completed: ${data.deleted_count} chats deleted, ${data.kept_count} chats kept${pinnedMsg}.`);
                // Refresh the chat list
                fetchChats();
            } else {
                alert('Failed to clean up chats: ' + (data.error || 'Unknown error'));
            }
        } catch (error) {
            console.error('Error cleaning up chats:', error);
            alert('Error cleaning up chats: ' + error.message);
        }
    }
    
    // Socket.io event handlers for chat management
    socket.on('connect', () => {
        // Fetch chats when connected
        fetchChats().then(chats => {
            // Only select a chat if it exists - don't auto-create
            if (chats.length > 0) {
                // Select the most recent chat (first in the list)
                const mostRecentChatId = chats[0].chat_id;
                if (mostRecentChatId) {
                    selectChat(mostRecentChatId);
                    localStorage.setItem('activeChatId', mostRecentChatId);
                }
            } else {
                // No chats exist yet, but don't create one automatically
                // Instead, show an empty state that prompts the user to create a new chat
                updateEmptyState();
            }
        });
    });
    
    // Handle chat selection response
    socket.on('chat_history', (data) => {
        // Remove any loading messages
        const loadingMessages = document.querySelectorAll('.loading-message');
        loadingMessages.forEach(msg => msg.remove());
        
        // Store the selected chat ID
        const chatId = data.chat_id;
        if (chatId) {
            localStorage.setItem('activeChatId', chatId);
        }
    });
    
    // Handle chat renaming event
    socket.on('chat_renamed', (data) => {
        console.log('Chat renamed event received:', data);
        const chatId = data.chat_id;
        const newName = data.new_name;
        
        if (!chatId || !newName) {
            console.error('Invalid chat rename data received:', data);
            return;
        }
        
        // Update the chat name in the sidebar
        const chatElements = document.querySelectorAll('.chat-item');
        let chatElementFound = false;
        
        chatElements.forEach(element => {
            if (element.dataset.chatId === chatId) {
                chatElementFound = true;
                const nameElement = element.querySelector('.chat-item-name');
                if (nameElement) {
                    console.log(`Updating chat name from "${nameElement.textContent}" to "${newName}"`);
                    nameElement.textContent = newName;
                    
                    // Add a brief highlight effect
                    element.classList.add('highlight');
                    setTimeout(() => {
                        element.classList.remove('highlight');
                    }, 1500);
                } else {
                    console.error('Chat name element not found in chat item');
                }
            }
        });
        
        if (!chatElementFound) {
            console.log('Chat element not found in sidebar, refreshing chat list');
            // If we can't find the chat element, refresh the whole list
            fetchChats();
        }
        
        // Also update the current chat title if this is the active chat
        const currentChatId = localStorage.getItem('activeChatId');
        if (currentChatId === chatId) {
            const chatTitle = document.querySelector('#chat-title');
            if (chatTitle) {
                console.log(`Updating active chat title to "${newName}"`);
                chatTitle.textContent = newName;
            } else {
                console.log('Chat title element not found in DOM');
            }
        }
    });
    
    // Loading state for Send button and message container
    const sendButton = document.querySelector('.send-button');
    const messages = document.getElementById('messages');
    
    // Create a function to show loading indicators
    function showLoadingState() {
        // 1. Add loading indicator to send button
        const buttonLoadingIndicator = document.createElement('span');
        buttonLoadingIndicator.className = 'loading-indicator';
        sendButton.appendChild(buttonLoadingIndicator);
        
        // 2. Add chat loading indicator in the messages container
        const loadingMessage = document.createElement('div');
        loadingMessage.className = 'message assistant-message loading-message';
        loadingMessage.innerHTML = '<div class="typing-indicator"><span></span><span></span><span></span></div>';
        messages.appendChild(loadingMessage);
        messages.scrollTop = messages.scrollHeight;
        
        return { buttonIndicator: buttonLoadingIndicator, messageIndicator: loadingMessage };
    }
    
    // Add loading indicator when sending message
    socket.on('connect', () => {
        // This function gets called from the HTML file's sendMessage function
        window.showResponseLoading = function() {
            const loadingElements = showLoadingState();
            
            // Store the loading elements in window so they can be removed when response arrives
            window.currentLoadingElements = loadingElements;
        };
        
        // Remove loading indicators when response is received
        socket.on('response', () => {
            if (window.currentLoadingElements) {
                // Remove button loading indicator
                if (window.currentLoadingElements.buttonIndicator && 
                    window.currentLoadingElements.buttonIndicator.parentNode) {
                    window.currentLoadingElements.buttonIndicator.parentNode.removeChild(
                        window.currentLoadingElements.buttonIndicator
                    );
                }
                
                // Remove message loading indicator
                if (window.currentLoadingElements.messageIndicator && 
                    window.currentLoadingElements.messageIndicator.parentNode) {
                    window.currentLoadingElements.messageIndicator.parentNode.removeChild(
                        window.currentLoadingElements.messageIndicator
                    );
                }
                
                // Clear the reference
                window.currentLoadingElements = null;
            }
        });
    });
    
    // Add animation to messages
    const observer = new MutationObserver(mutations => {
        mutations.forEach(mutation => {
            if (mutation.addedNodes.length) {
                mutation.addedNodes.forEach(node => {
                    if (node.classList && node.classList.contains('message') && !node.classList.contains('loading-message')) {
                        // Set initial state
                        node.style.opacity = '0';
                        node.style.transform = 'translateY(20px)';
                        
                        // Trigger animation after a small delay
                        setTimeout(() => {
                            node.style.transition = 'opacity 0.3s ease, transform 0.3s ease';
                            node.style.opacity = '1';
                            node.style.transform = 'translateY(0)';
                        }, 10);
                    }
                });
            }
        });
    });
    
    observer.observe(messages, { childList: true });
    
    // Enhance table styling
    function enhanceTableStyling() {
        const tables = document.querySelectorAll('.markdown-content table');
        tables.forEach(table => {
            // Add custom class for styling
            table.classList.add('enhanced-table');
            
            // Process table headers
            const headers = table.querySelectorAll('th');
            headers.forEach(header => {
                // Add emoji indicators for calibration types
                if (header.textContent.includes('Calibration Type')) {
                    header.setAttribute('data-column', 'calibration-type');
                }
                else if (header.textContent.includes('Requirements')) {
                    header.setAttribute('data-column', 'requirements');
                }
            });
            
            // Process table cells
            const cells = table.querySelectorAll('td');
            cells.forEach(cell => {
                // Add visual indicators for calibration types
                if (cell.textContent.includes('Static')) {
                    const indicator = document.createElement('span');
                    indicator.className = 'indicator';
                    indicator.style.backgroundColor = '#000';
                    cell.insertBefore(indicator, cell.firstChild);
                }
                else if (cell.textContent.includes('Dynamic')) {
                    const indicator = document.createElement('span');
                    indicator.className = 'indicator';
                    indicator.style.backgroundColor = '#0066ff';
                    cell.insertBefore(indicator, cell.firstChild);
                }
                else if (cell.textContent.includes('Plug & Play')) {
                    const indicator = document.createElement('span');
                    indicator.className = 'indicator';
                    indicator.style.backgroundColor = '#00cc66';
                    cell.insertBefore(indicator, cell.firstChild);
                }
            });
        });
    }
    
    // Process tables when new messages arrive
    socket.on('response', () => {
        // Wait for DOM to update
        setTimeout(enhanceTableStyling, 100);
    });
    
    // Initial enhancement
    enhanceTableStyling();
    
    // Function to add a chat to the sidebar
    function addChatToSidebar(chat) {
        console.log(`Adding chat to sidebar: ${chat.chat_id}, ${chat.chat_name}, pinned: ${chat.is_pinned}`);
        
        const chatsList = document.getElementById('chatList');
        if (!chatsList) {
            console.error("Could not find chatList element");
            return;
        }
        
        // Check if this chat already exists in the sidebar
        const existingChatItem = document.querySelector(`.chat-item[data-id="${chat.chat_id}"]`);
        if (existingChatItem) {
            console.log(`Chat ${chat.chat_id} already exists in sidebar, updating it`);
            
            // Update the chat name if needed
            const chatNameElement = existingChatItem.querySelector('.chat-name');
            if (chatNameElement && chatNameElement.textContent !== chat.chat_name) {
                chatNameElement.textContent = chat.chat_name;
            }
            
            // Update active state
            if (chat.is_active) {
                existingChatItem.classList.add('active');
            } else {
                existingChatItem.classList.remove('active');
            }
            
            // Update pinned state
            if (chat.is_pinned) {
                existingChatItem.classList.add('pinned');
                const pinButton = existingChatItem.querySelector('.chat-action-btn.pin-btn');
                if (pinButton) {
                    pinButton.classList.add('pinned');
                    pinButton.querySelector('i').className = 'fas fa-thumbtack';
                }
            } else {
                existingChatItem.classList.remove('pinned');
                const pinButton = existingChatItem.querySelector('.chat-action-btn.pin-btn');
                if (pinButton) {
                    pinButton.classList.remove('pinned');
                    pinButton.querySelector('i').className = 'fas fa-thumbtack';
                }
            }
            
            return;
        }
        
        // Remove any empty state message
        const emptyMessage = chatsList.querySelector('.empty-chats-message');
        if (emptyMessage) {
            emptyMessage.remove();
        }
        
        // Create a new chat item
        const chatItem = document.createElement('div');
        chatItem.className = `chat-item${chat.is_active ? ' active' : ''}${chat.is_pinned ? ' pinned' : ''}`;
        chatItem.setAttribute('data-id', chat.chat_id);
        
        // Create chat icon
        const chatIcon = document.createElement('div');
        chatIcon.className = 'chat-item-icon';
        const iconElement = document.createElement('i');
        iconElement.className = 'fas fa-comment';
        chatIcon.appendChild(iconElement);
        
        // Create chat item content container
        const chatItemContent = document.createElement('div');
        chatItemContent.className = 'chat-item-content';
        
        // Create chat name container
        const chatNameContainer = document.createElement('div');
        chatNameContainer.className = 'chat-item-name';
        chatNameContainer.textContent = chat.chat_name || 'New Chat';
        
        // Add icon and name to content container
        chatItemContent.appendChild(chatIcon);
        chatItemContent.appendChild(chatNameContainer);
        
        // Create actions container
        const actionsContainer = document.createElement('div');
        actionsContainer.className = 'chat-item-actions';
        
        // Create pin button
        const pinBtn = document.createElement('button');
        pinBtn.className = `chat-action-btn pin-btn${chat.is_pinned ? ' pinned' : ''}`;
        pinBtn.title = chat.is_pinned ? 'Unpin chat' : 'Pin chat';
        pinBtn.innerHTML = '<i class="fas fa-thumbtack"></i>';
        pinBtn.addEventListener('click', (e) => {
            e.stopPropagation();
            togglePinChat(chat.chat_id);
        });
        
        // Create rename button
        const renameBtn = document.createElement('button');
        renameBtn.className = 'chat-action-btn rename-btn';
        renameBtn.title = 'Rename chat';
        renameBtn.innerHTML = '<i class="fas fa-edit"></i>';
        renameBtn.addEventListener('click', (e) => {
            e.stopPropagation();
            openRenameDialog(chat.chat_id, chat.chat_name);
        });
        
        // Create delete button
        const deleteBtn = document.createElement('button');
        deleteBtn.className = 'chat-action-btn delete-btn';
        deleteBtn.title = 'Delete chat';
        deleteBtn.innerHTML = '<i class="fas fa-trash"></i>';
        deleteBtn.addEventListener('click', (e) => {
            e.stopPropagation();
            deleteChat(chat.chat_id);
        });
        
        // Add buttons to actions container
        actionsContainer.appendChild(pinBtn);
        actionsContainer.appendChild(renameBtn);
        actionsContainer.appendChild(deleteBtn);
        
        // Add content and actions to chat item
        chatItem.appendChild(chatItemContent);
        chatItem.appendChild(actionsContainer);
        
        // Add click event to select this chat
        chatItem.addEventListener('click', () => {
            console.log(`Chat ${chat.chat_id} clicked, selecting it`);
            selectChat(chat.chat_id);
        });
        
        // Add to the chat list
        chatsList.appendChild(chatItem);
        console.log(`Added chat ${chat.chat_id} to sidebar`);
    }
}); 