function sendMessage() {
    const userInput = document.getElementById('user-input');
    const message = userInput.value.trim();
    
    if (message === '') return;
    
    // Clear the input field
    userInput.value = '';
    
    // Get values from dropdowns
    const year = document.getElementById('yearSelect').value;
    const make = document.getElementById('makeSelect').value;
    const model = document.getElementById('modelSelect').value;
    
    // Extract vehicle info from user message
    const extractedVehicleInfo = extractVehicleFromText(message);
    
    // Create the vehicle context object
    let vehicleContext = {
        year: year || '',
        make: make || '',
        model: model || '',
        // Track which fields were explicitly mentioned in the current message
        fromCurrentMessage: {
            year: extractedVehicleInfo.year ? true : false,
            make: extractedVehicleInfo.make ? true : false,
            model: extractedVehicleInfo.modelExplicitlyMentioned ? true : false
        }
    };
    
    // Override dropdown values with values extracted from text when present
    if (extractedVehicleInfo.year) {
        vehicleContext.year = extractedVehicleInfo.year;
    }
    if (extractedVehicleInfo.make) {
        vehicleContext.make = extractedVehicleInfo.make;
    }
    if (extractedVehicleInfo.model && extractedVehicleInfo.modelExplicitlyMentioned) {
        vehicleContext.model = extractedVehicleInfo.model;
    } else if (extractedVehicleInfo.make && !extractedVehicleInfo.modelExplicitlyMentioned) {
        // If make was mentioned but model wasn't, clear the model to prevent incorrect assumptions
        vehicleContext.model = '';
    }
    
    // Store the context
    window.vehicleContext = vehicleContext;
    
    console.log('Sending message with vehicle context:', vehicleContext);
    
    // Add user message to chat
    addMessage('user', message);
    
    // Show thinking indicator
    showThinking();
    
    // Send to server with vehicle context
    socket.emit('user_message', {
        message: message,
        vehicle_context: vehicleContext,
        conversation_id: currentConversationId
    });
    
    // Resize input field
    setTimeout(() => adjustTextareaHeight(userInput), 10);
} 