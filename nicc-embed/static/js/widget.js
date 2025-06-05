// NICC Chat Widget JavaScript
(function() {
    'use strict';
    
    // DOM Elements
    let chatMessages, chatInput, sendBtn, vinInput, vinDecodeBtn, closeBtn;
    
    // Initialize widget
    function init() {
        // Get DOM elements
        chatMessages = document.getElementById('chat-messages');
        chatInput = document.getElementById('chat-input');
        sendBtn = document.getElementById('send-btn');
        vinInput = document.getElementById('vin-input');
        vinDecodeBtn = document.getElementById('vin-decode-btn');
        closeBtn = document.getElementById('nicc-close');
        
        // Set up event listeners
        setupEventListeners();
    }
    
    // Set up event listeners
    function setupEventListeners() {
        // Send button
        sendBtn.addEventListener('click', sendMessage);
        
        // Chat input - send on Enter (but not Shift+Enter)
        chatInput.addEventListener('keypress', function(e) {
            if (e.key === 'Enter' && !e.shiftKey) {
                e.preventDefault();
                sendMessage();
            }
        });
        
        // VIN decode button
        vinDecodeBtn.addEventListener('click', decodeVIN);
        
        // VIN input - decode on Enter
        vinInput.addEventListener('keypress', function(e) {
            if (e.key === 'Enter') {
                decodeVIN();
            }
        });
        
        // Close button
        closeBtn.addEventListener('click', function() {
            // Send close message to parent window
            if (window.parent !== window) {
                window.parent.postMessage({type: 'NICC_CLOSE'}, '*');
            }
        });
        
        // Auto-resize chat input
        chatInput.addEventListener('input', function() {
            this.style.height = 'auto';
            this.style.height = Math.min(this.scrollHeight, 100) + 'px';
        });
    }
    
    // Send chat message
    function sendMessage() {
        const message = chatInput.value.trim();
        
        if (!message) return;
        
        // Add user message to chat
        addUserMessage(message);
        
        // Clear input
        chatInput.value = '';
        chatInput.style.height = 'auto';
        
        // Disable send button
        sendBtn.disabled = true;
        
        // Show typing indicator
        showTypingIndicator();
        
        // Send to NICC API
        fetch('/api/chat', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({
                message: message
            })
        })
        .then(response => response.json())
        .then(data => {
            hideTypingIndicator();
            sendBtn.disabled = false;
            
            if (data.success) {
                addNICCMessage(data.response);
            } else {
                addNICCMessage('Sorry, I encountered an error. Please try again.');
            }
        })
        .catch(error => {
            console.error('Error sending message:', error);
            hideTypingIndicator();
            sendBtn.disabled = false;
            addNICCMessage('Sorry, I\'m having connection issues. Please try again.');
        });
    }
    
    // Decode VIN
    function decodeVIN() {
        const vin = vinInput.value.trim().toUpperCase();
        
        if (!vin) {
            addNICCMessage('Please enter a VIN number.');
            return;
        }
        
        if (vin.length !== 17) {
            addNICCMessage('VIN must be exactly 17 characters long.');
            return;
        }
        
        // Add user message
        addUserMessage(`VIN: ${vin}`);
        
        // Clear VIN input
        vinInput.value = '';
        
        // Show typing indicator
        showTypingIndicator();
        
        // Decode VIN
        fetch('/api/vin-decode', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json'
            },
            body: JSON.stringify({ vin: vin })
        })
        .then(response => response.json())
        .then(data => {
            hideTypingIndicator();
            
            if (data.success) {
                const vehicleInfo = `${data.year || ''} ${data.make || ''} ${data.model || ''}`.trim();
                addNICCMessage(`🚗 Vehicle identified: **${vehicleInfo}**\n\nWould you like me to search for calibration procedures for this vehicle?`);
                
                // Add quick action buttons
                addQuickActions([
                    {
                        text: '🔧 Show Calibrations',
                        action: `What calibrations are needed for a ${vehicleInfo}?`
                    },
                    {
                        text: '🛠️ Scan Tools',
                        action: `What scan tools are needed for ${data.make} ADAS systems?`
                    }
                ]);
            } else {
                addNICCMessage(`❌ ${data.error || 'Could not decode this VIN. Please check the VIN and try again.'}`);
            }
        })
        .catch(error => {
            console.error('Error decoding VIN:', error);
            hideTypingIndicator();
            addNICCMessage('❌ Error decoding VIN. Please check your connection and try again.');
        });
    }
    
    // Add user message to chat
    function addUserMessage(message) {
        const messageDiv = document.createElement('div');
        messageDiv.className = 'user-message';
        messageDiv.innerHTML = `
            <div class="message-content">
                ${escapeHtml(message)}
            </div>
        `;
        
        chatMessages.appendChild(messageDiv);
        scrollToBottom();
    }
    
    // Add NICC message to chat
    function addNICCMessage(message) {
        const messageDiv = document.createElement('div');
        messageDiv.className = 'nicc-message';
        messageDiv.innerHTML = `
            <div class="nicc-avatar">🤖</div>
            <div class="message-content">
                ${formatMessage(message)}
            </div>
        `;
        
        chatMessages.appendChild(messageDiv);
        scrollToBottom();
    }
    
    // Add quick action buttons
    function addQuickActions(actions) {
        const actionsDiv = document.createElement('div');
        actionsDiv.className = 'quick-actions';
        
        actions.forEach(action => {
            const btn = document.createElement('button');
            btn.className = 'quick-btn';
            btn.innerHTML = action.text;
            btn.onclick = () => insertQuickText(action.action);
            actionsDiv.appendChild(btn);
        });
        
        const lastMessage = chatMessages.lastElementChild;
        if (lastMessage && lastMessage.classList.contains('nicc-message')) {
            lastMessage.querySelector('.message-content').appendChild(actionsDiv);
        }
    }
    
    // Show typing indicator
    function showTypingIndicator() {
        const typingDiv = document.createElement('div');
        typingDiv.className = 'typing-indicator';
        typingDiv.id = 'typing-indicator';
        typingDiv.innerHTML = `
            <div class="nicc-avatar">🤖</div>
            <div class="message-content">
                <div class="typing-dots">
                    <span></span>
                    <span></span>
                    <span></span>
                </div>
            </div>
        `;
        
        chatMessages.appendChild(typingDiv);
        scrollToBottom();
    }
    
    // Hide typing indicator
    function hideTypingIndicator() {
        const typingIndicator = document.getElementById('typing-indicator');
        if (typingIndicator) {
            typingIndicator.remove();
        }
    }
    
    // Format message with basic markdown support
    function formatMessage(message) {
        return message
            .replace(/\*\*(.*?)\*\*/g, '<strong>$1</strong>')
            .replace(/\*(.*?)\*/g, '<em>$1</em>')
            .replace(/\n/g, '<br>');
    }
    
    // Escape HTML
    function escapeHtml(text) {
        const div = document.createElement('div');
        div.textContent = text;
        return div.innerHTML;
    }
    
    // Scroll to bottom of chat
    function scrollToBottom() {
        setTimeout(() => {
            chatMessages.scrollTop = chatMessages.scrollHeight;
        }, 100);
    }
    
    // Insert quick text into chat input (global function for onclick handlers)
    window.insertQuickText = function(text) {
        chatInput.value = text;
        chatInput.focus();
        chatInput.style.height = 'auto';
        chatInput.style.height = Math.min(chatInput.scrollHeight, 100) + 'px';
    };
    
    // Initialize when DOM is loaded
    if (document.readyState === 'loading') {
        document.addEventListener('DOMContentLoaded', init);
    } else {
        init();
    }
    
})(); 