(function() {
    'use strict';
    
    // Configuration
    const NICC_HOST = '{{ request.host }}';
    const WIDGET_URL = `http://${NICC_HOST}`;
    
    // Check if already loaded
    if (window.NICCWidget) {
        return;
    }
    
    // Create the NICC Widget namespace
    window.NICCWidget = {
        isLoaded: false,
        isOpen: false,
        widget: null,
        buttonContent: null,
        chatContent: null
    };
    
    // Default options
    const defaultOptions = {
        position: 'bottom-right', // bottom-right, bottom-left, top-right, top-left
        buttonText: 'Ask NICC',
        buttonColor: '#2196F3',
        zIndex: 999999,
        width: '400px',
        height: '600px'
    };
    
    // Initialize the widget
    function init(options = {}) {
        const config = { ...defaultOptions, ...options };
        
        // Create expandable button widget
        createExpandableWidget(config);
        
        window.NICCWidget.isLoaded = true;
    }
    
    // Create expandable widget
    function createExpandableWidget(config) {
        const widget = document.createElement('div');
        widget.id = 'nicc-expandable-widget';
        
        // Position styles
        const positionStyles = getPositionStyles(config.position);
        
        // Initial button state styles
        Object.assign(widget.style, {
            position: 'fixed',
            backgroundColor: config.buttonColor,
            color: 'white',
            borderRadius: '25px',
            cursor: 'pointer',
            fontSize: '14px',
            fontFamily: 'Arial, sans-serif',
            fontWeight: '500',
            zIndex: config.zIndex,
            boxShadow: '0 4px 12px rgba(0,0,0,0.15)',
            transition: 'all 0.4s cubic-bezier(0.34, 1.56, 0.64, 1)',
            border: 'none',
            outline: 'none',
            userSelect: 'none',
            overflow: 'hidden',
            width: 'auto',
            height: 'auto',
            ...positionStyles
        });
        
        // Create button content
        const buttonContent = document.createElement('div');
        buttonContent.id = 'nicc-button-content';
        buttonContent.innerHTML = `
            <i class="fas fa-robot" style="margin-right: 8px;"></i>
            ${config.buttonText}
        `;
        buttonContent.style.padding = '12px 20px';
        buttonContent.style.display = 'flex';
        buttonContent.style.alignItems = 'center';
        buttonContent.style.justifyContent = 'center';
        buttonContent.style.whiteSpace = 'nowrap';
        
        // Create chat content (initially hidden)
        const chatContent = document.createElement('div');
        chatContent.id = 'nicc-chat-content';
        chatContent.style.display = 'none';
        chatContent.style.width = config.width;
        chatContent.style.height = config.height;
        chatContent.style.background = 'white';
        chatContent.style.color = '#333';
        chatContent.style.borderRadius = '12px';
        
        // Create iframe for chat
        const iframe = document.createElement('iframe');
        iframe.src = WIDGET_URL;
        iframe.style.width = '100%';
        iframe.style.height = '100%';
        iframe.style.border = 'none';
        iframe.style.borderRadius = '12px';
        
        // Debug logging
        console.log('NICC Widget: Creating iframe with URL:', WIDGET_URL);
        
        // Add error handling for iframe loading
        iframe.addEventListener('load', function() {
            console.log('NICC Widget: Iframe loaded successfully');
        });
        
        iframe.addEventListener('error', function() {
            console.error('NICC Widget: Iframe failed to load');
            chatContent.innerHTML = `
                <div style="
                    display: flex;
                    align-items: center;
                    justify-content: center;
                    height: 100%;
                    background: #ffebee;
                    font-family: Arial, sans-serif;
                    color: #c62828;
                    font-size: 14px;
                    text-align: center;
                    padding: 20px;
                    border-radius: 12px;
                ">
                    <div>
                        <div style="margin-bottom: 10px;">⚠️</div>
                        <div>Unable to load NICC widget.</div>
                        <div style="font-size: 12px; margin-top: 5px;">Please check if the NICC server is running.</div>
                    </div>
                </div>
            `;
        });
        
        chatContent.appendChild(iframe);
        
        // Add both contents to widget
        widget.appendChild(buttonContent);
        widget.appendChild(chatContent);
        
        // Hover effects (only when collapsed)
        widget.addEventListener('mouseenter', function() {
            if (!window.NICCWidget.isOpen) {
                this.style.transform = 'scale(1.05)';
                this.style.boxShadow = '0 6px 16px rgba(0,0,0,0.2)';
            }
        });
        
        widget.addEventListener('mouseleave', function() {
            if (!window.NICCWidget.isOpen) {
                this.style.transform = 'scale(1)';
                this.style.boxShadow = '0 4px 12px rgba(0,0,0,0.15)';
            }
        });
        
        // Click handler
        widget.addEventListener('click', function(e) {
            // Only toggle if clicking the button content, not the chat area
            if (!window.NICCWidget.isOpen || e.target === buttonContent || buttonContent.contains(e.target)) {
                toggleWidget();
            }
        });
        
        document.body.appendChild(widget);
        window.NICCWidget.widget = widget;
        window.NICCWidget.buttonContent = buttonContent;
        window.NICCWidget.chatContent = chatContent;
        
        // Load Font Awesome if not already loaded
        if (!document.querySelector('link[href*="font-awesome"]')) {
            const fontAwesome = document.createElement('link');
            fontAwesome.rel = 'stylesheet';
            fontAwesome.href = 'https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css';
            document.head.appendChild(fontAwesome);
        }
    }
    

    
    // Get position styles for button
    function getPositionStyles(position) {
        const styles = {};
        
        switch (position) {
            case 'bottom-right':
                styles.bottom = '20px';
                styles.right = '20px';
                break;
            case 'bottom-left':
                styles.bottom = '20px';
                styles.left = '20px';
                break;
            case 'top-right':
                styles.top = '20px';
                styles.right = '20px';
                break;
            case 'top-left':
                styles.top = '20px';
                styles.left = '20px';
                break;
        }
        
        return styles;
    }
    
    
    
    // Toggle widget visibility
    function toggleWidget() {
        if (window.NICCWidget.isOpen) {
            closeWidget();
        } else {
            openWidget();
        }
    }
    
    // Expand widget
    function openWidget() {
        if (window.NICCWidget.widget && window.NICCWidget.buttonContent && window.NICCWidget.chatContent) {
            const widget = window.NICCWidget.widget;
            const buttonContent = window.NICCWidget.buttonContent;
            const chatContent = window.NICCWidget.chatContent;
            
            console.log('NICC Widget: Expanding button to chat');
            
            // Start expansion animation
            widget.style.width = chatContent.style.width;
            widget.style.height = chatContent.style.height;
            widget.style.borderRadius = '12px';
            widget.style.boxShadow = '0 8px 32px rgba(0,0,0,0.3)';
            widget.style.transform = 'scale(1)';
            
            // After size animation starts, switch content
            setTimeout(() => {
                buttonContent.style.display = 'none';
                chatContent.style.display = 'block';
            }, 200);
            
            window.NICCWidget.isOpen = true;
        }
    }
    
    // Collapse widget
    function closeWidget() {
        if (window.NICCWidget.widget && window.NICCWidget.buttonContent && window.NICCWidget.chatContent) {
            const widget = window.NICCWidget.widget;
            const buttonContent = window.NICCWidget.buttonContent;
            const chatContent = window.NICCWidget.chatContent;
            
            console.log('NICC Widget: Collapsing chat to button');
            
            // Switch content back to button first
            chatContent.style.display = 'none';
            buttonContent.style.display = 'flex';
            
            // Then animate back to button size
            setTimeout(() => {
                widget.style.width = 'auto';
                widget.style.height = 'auto';
                widget.style.borderRadius = '25px';
                widget.style.boxShadow = '0 4px 12px rgba(0,0,0,0.15)';
            }, 50);
            
            window.NICCWidget.isOpen = false;
        }
    }
    
    // Public API
    window.NICCWidget.init = init;
    window.NICCWidget.open = openWidget;
    window.NICCWidget.close = closeWidget;
    window.NICCWidget.toggle = toggleWidget;
    
    // Auto-initialize if script has data-auto-init attribute
    const currentScript = document.currentScript;
    if (currentScript && currentScript.hasAttribute('data-auto-init')) {
        // Wait for DOM to be ready
        if (document.readyState === 'loading') {
            document.addEventListener('DOMContentLoaded', function() {
                init();
            });
        } else {
            init();
        }
    }
    
    // Listen for messages from the iframe
    window.addEventListener('message', function(event) {
        // Only accept messages from our iframe
        if (event.data && event.data.type === 'NICC_CLOSE') {
            console.log('NICC Widget: Received close message from iframe');
            closeWidget();
        }
    });
    
})(); 