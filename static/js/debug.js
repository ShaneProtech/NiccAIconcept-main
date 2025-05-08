
// Debug script for chat functionality
console.log("Debug script loaded!");

// Save original fetch function
const originalFetch = window.fetch;

// Override fetch to log requests and responses
window.fetch = async function(url, options) {
    console.log(`Fetch request: ${url}`, options);
    
    try {
        // Call original fetch
        const response = await originalFetch(url, options);
        
        // Clone the response to read it
        const clone = response.clone();
        
        // Read and log response JSON if possible
        if (url.includes('/api/')) {
            try {
                const data = await clone.json();
                console.log(`Fetch response from ${url}:`, data);
            } catch (e) {
                console.log(`Error parsing JSON from ${url}:`, e);
            }
        }
        
        return response;
    } catch (error) {
        console.error(`Fetch error for ${url}:`, error);
        throw error;
    }
};

// Add additional debug logging for key functions
document.addEventListener('DOMContentLoaded', function() {
    console.log("DOM fully loaded");
    
    // Check if key elements exist
    const chatsList = document.getElementById('chats-list');
    console.log("Chats list element exists:", !!chatsList);
    
    const newChatButton = document.getElementById('new-chat-btn');
    console.log("New chat button exists:", !!newChatButton);
    
    if (newChatButton) {
        // Add extra logging on click
        const originalClickHandler = newChatButton.onclick;
        newChatButton.onclick = function(e) {
            console.log("New chat button clicked");
            if (originalClickHandler) return originalClickHandler.call(this, e);
        };
    }
    
    // Log localStorage contents
    console.log("Current localStorage:", {...localStorage});
});

// Monitor DOM changes in the chat list
if (window.MutationObserver) {
    const chatsList = document.getElementById('chats-list');
    if (chatsList) {
        const observer = new MutationObserver(function(mutations) {
            console.log("Chats list changed:", mutations);
            console.log("Current chats list content:", chatsList.innerHTML);
            
            // Count chat items
            const chatItems = chatsList.querySelectorAll('.chat-item');
            console.log(`Number of chat items in DOM: ${chatItems.length}`);
        });
        
        observer.observe(chatsList, { childList: true, subtree: true });
        console.log("Watching chats list for changes");
    }
}

// Test for JSON parsing issues
try {
    const testJsonWithTrailingComma = '{"success":true,"chats":[{"chat_id":"1"}],}';
    console.log("Parsing JSON with trailing comma...");
    try {
        JSON.parse(testJsonWithTrailingComma);
        console.log("Unexpected: Browser parsed invalid JSON with trailing comma");
    } catch (e) {
        console.log("Expected error parsing invalid JSON:", e.message);
    }
    
    const testValidJson = '{"success":true,"chats":[{"chat_id":"1"}]}';
    console.log("Parsing valid JSON...");
    const parsed = JSON.parse(testValidJson);
    console.log("Successfully parsed valid JSON:", parsed);
} catch (e) {
    console.error("Error in JSON parsing test:", e);
}

console.log("Debug script initialization complete");
