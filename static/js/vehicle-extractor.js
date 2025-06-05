/**
 * Vehicle Extractor
 * This script extracts vehicle information (year, make, model) from user input
 * and automatically updates the vehicle selection dropdowns.
 * Now also detects collision area mentions and updates system selection.
 */

document.addEventListener('DOMContentLoaded', function() {
    console.log('Vehicle extractor initialized');
    
    // Get references to UI elements
    const userInput = document.getElementById('userInput');
    const sendButton = document.querySelector('.send-button');
    const systemSelect = document.getElementById('systemSelect');
    
    // Store the last value of the input to detect changes
    let lastInputValue = '';
    
    // Check for changes to the input field (handles both typing and speech-to-text)
    function checkForInputChanges() {
        const currentValue = userInput.value;
        
        // If the value has changed, process it
        if (currentValue !== lastInputValue) {
            lastInputValue = currentValue;
            
            if (currentValue && currentValue.trim() !== '') {
                // Extract vehicle information from the message
                const extractedVehicle = extractVehicleFromText(currentValue);
                console.log('Extracted vehicle info:', extractedVehicle);
                
                // Update the dropdowns if we found vehicle information
                if (extractedVehicle.year || extractedVehicle.make || extractedVehicle.model) {
                    updateVehicleDropdowns(extractedVehicle);
                }
                
                // Extract collision area from message
                const collisionArea = extractCollisionArea(currentValue);
                if (collisionArea) {
                    console.log(`Detected collision area: ${collisionArea}`);
                    updateSystemForCollisionArea(collisionArea);
                }
            }
        }
    }
    
    // Listen for standard input events (typing)
    userInput.addEventListener('input', function(e) {
        checkForInputChanges();
    });
    
    // Poll for changes that might come from speech recognition
    // This catches changes that don't trigger input events
    setInterval(checkForInputChanges, 500);
    
    // Also check when the mic button is clicked (if it exists)
    const micButton = document.querySelector('.mic-button');
    if (micButton) {
        micButton.addEventListener('click', function() {
            // Wait a bit for speech recognition to potentially complete
            setTimeout(checkForInputChanges, 1000);
        });
    }
    
    /**
     * Extract collision area from user message
     * @param {string} text - The text to extract collision area from
     * @return {string|null} - The detected collision area or null
     */
    function extractCollisionArea(text) {
        const textLower = text.toLowerCase();
        
        console.log("Analyzing for collision area: " + textLower);
        
        // Handle continuous speech better with more relaxed patterns
        
        // Check for specific corners first, with more flexible patterns for speech
        
        // Front left patterns - more flexible for speech recognition
        if (/front.{0,3}left|left.{0,3}front|driver.{0,5}front|front.{0,5}driver/i.test(textLower)) {
            console.log("Detected front left from: " + textLower);
            return 'front left';
        }
        
        // Front right patterns - more flexible for speech recognition
        if (/front.{0,3}right|right.{0,3}front|passenger.{0,5}front|front.{0,5}passenger/i.test(textLower)) {
            console.log("Detected front right from: " + textLower);
            return 'front right';
        }
        
        // Rear left patterns - more flexible for speech recognition
        if (/rear.{0,3}left|left.{0,3}rear|back.{0,3}left|left.{0,3}back|driver.{0,5}rear|rear.{0,5}driver/i.test(textLower)) {
            console.log("Detected rear left from: " + textLower);
            return 'rear left';
        }
        
        // Rear right patterns - more flexible for speech recognition
        if (/rear.{0,3}right|right.{0,3}rear|back.{0,3}right|right.{0,3}back|passenger.{0,5}rear|rear.{0,5}passenger/i.test(textLower)) {
            console.log("Detected rear right from: " + textLower);
            return 'rear right';
        }
        
        // Driver side patterns - more flexible for speech recognition
        if (/driver.{0,3}side|left.{0,3}side|driver.?s.{0,3}door|left.{0,3}door/i.test(textLower)) {
            console.log("Detected driver side from: " + textLower);
            return 'driver side';
        }
        
        // Passenger side patterns - more flexible for speech recognition
        if (/passenger.{0,3}side|right.{0,3}side|passenger.?s.{0,3}door|right.{0,3}door/i.test(textLower)) {
            console.log("Detected passenger side from: " + textLower);
            return 'passenger side';
        }
        
        // Front collision - more flexible for speech recognition
        if (/front|forward|hood|front.{0,3}(of|end|bumper)|hit.{0,5}front/i.test(textLower)) {
            console.log("Detected front from: " + textLower);
            return 'front';
        }
        
        // Rear collision - more flexible for speech recognition
        if (/rear|back|trunk|tailgate|rear.{0,3}(of|end|bumper)|hit.{0,5}(rear|back)|behind/i.test(textLower)) {
            console.log("Detected rear from: " + textLower);
            return 'rear';
        }
        
        // Side collision - more flexible for speech recognition 
        if (/side|t.?bone|side.{0,3}impact/i.test(textLower)) {
            console.log("Detected generic side from: " + textLower);
            return 'side';
        }
        
        console.log("No collision area detected from: " + textLower);
        return null;
    }
    
    /**
     * Update system dropdown based on detected collision area
     * @param {string} collisionArea - The collision area (front, rear, side)
     */
    function updateSystemForCollisionArea(collisionArea) {
        if (!systemSelect) {
            console.error('System dropdown not found in the DOM');
            return;
        }
        
        console.log(`Detected collision area: ${collisionArea}`);
        
        // Per updated requirements: No longer auto-selecting systems,
        // but still selecting POIs based on the collision area
        selectPOIsForCollisionArea(collisionArea);
    }
    
    /**
     * Select POIs based on the detected collision area
     * @param {string} collisionArea - The collision area (front, rear, side)
     */
    function selectPOIsForCollisionArea(collisionArea) {
        // First clear any existing POI selections
        clearPOISelections();
        
        // Get all POI markers
        const markers = document.querySelectorAll('.poi-marker');
        if (!markers || markers.length === 0) {
            console.log('No POI markers found');
            return;
        }
        
        console.log(`Selecting POIs for collision area: ${collisionArea}`);
        
        // Filter markers based on collision area
        const areaMarkers = Array.from(markers).filter(marker => {
            const area = marker.dataset.poiArea;
            // Get the POI name/position to determine if it's a corner POI
            const poiName = marker.dataset.poiName ? marker.dataset.poiName.toLowerCase() : '';
            const poiNumber = marker.dataset.poiNumber;
            
            console.log(`Checking POI #${poiNumber}: area=${area}, name=${poiName}`);
            
            // For debugging - log exact matches
            if (collisionArea === 'front left' && 
                ((poiName.includes('left') && poiName.includes('front')) || 
                 (poiName.includes('driver') && poiName.includes('front')))) {
                console.log(`Found exact match for front left: ${poiName} (#${poiNumber})`);
            }
            
            // The left/right determination needs to be more precise
            // Front left should correspond to driver side front (usually POI #11)
            // Front right should correspond to passenger side front (usually POI #1)
            
            // Specific corner areas with more precise matching
            if (collisionArea === 'front left') {
                // Only select driver-side front corner (usually #11)
                return (area === 'front' && 
                       (poiName.includes('driver') || 
                        (poiName.includes('left') && poiName.includes('front')) ||
                        (poiName.includes('left') && poiName.includes('corner')) ||
                        poiNumber === '11')); // Driver side front corner
            }
            else if (collisionArea === 'front right') {
                // Only select passenger-side front corner (usually #1)
                return (area === 'front' && 
                       (poiName.includes('passenger') || 
                        (poiName.includes('right') && poiName.includes('front')) ||
                        (poiName.includes('right') && poiName.includes('corner')) ||
                        poiNumber === '1')); // Passenger side front corner
            }
            else if (collisionArea === 'rear left') {
                // Only select driver-side rear corner (usually #12)
                return (area === 'rear' && 
                       (poiName.includes('driver') || 
                        (poiName.includes('left') && poiName.includes('rear')) ||
                        (poiName.includes('left') && poiName.includes('corner')) ||
                        poiNumber === '12')); // Driver side rear corner
            }
            else if (collisionArea === 'rear right') {
                // Only select passenger-side rear corner (usually #8)
                return (area === 'rear' && 
                       (poiName.includes('passenger') || 
                        (poiName.includes('right') && poiName.includes('rear')) ||
                        (poiName.includes('right') && poiName.includes('corner')) ||
                        poiNumber === '8')); // Passenger side rear corner
            }
            // Only select driver-side POIs when specifically mentioned
            else if (collisionArea === 'driver side' && area === 'side') {
                return poiName.includes('driver') || poiName.includes('left');
            } 
            // Only select passenger-side POIs when specifically mentioned
            else if (collisionArea === 'passenger side' && area === 'side') {
                return poiName.includes('passenger') || poiName.includes('right');
            }
            // For generic 'side' collision areas, don't select any side POIs
            else if (collisionArea === 'side') {
                return false; // Don't select any side POIs for generic side mentions
            }
            // For front collisions, only select center front POIs (not corner POIs)
            else if (collisionArea === 'front') {
                return area === 'front' && 
                      !poiName.includes('left') && 
                      !poiName.includes('right') && 
                      !poiName.includes('driver') && 
                      !poiName.includes('passenger') &&
                      !poiName.includes('corner');
            }
            // For rear collisions, only select center rear POIs (not corner POIs)
            else if (collisionArea === 'rear') {
                return area === 'rear' && 
                      !poiName.includes('left') && 
                      !poiName.includes('right') && 
                      !poiName.includes('driver') && 
                      !poiName.includes('passenger') &&
                      !poiName.includes('corner');
            }
            // Fallback (should not reach here)
            else {
                return false;
            }
        });
        
        // Select all matching markers
        areaMarkers.forEach(marker => {
            const poiNumber = marker.dataset.poiNumber;
            const poiName = marker.dataset.poiName ? marker.dataset.poiName : '';
            console.log(`Selecting POI #${poiNumber}: ${poiName}`);
            marker.click(); // Use the existing click event to toggle selection
        });
        
        console.log(`Selected ${areaMarkers.length} POIs for ${collisionArea} collision area`);
    }
    
    /**
     * Clear all POI selections
     */
    function clearPOISelections() {
        // Find and clear all selected POIs
        const selectedPOIs = document.querySelectorAll('.poi-marker.selected');
        selectedPOIs.forEach(marker => {
            marker.click(); // Use the existing click event to toggle selection
        });
    }
    
    /**
     * Extract vehicle information from text using regex patterns
     * @param {string} text - The text to extract vehicle info from
     * @return {object} - Object with year, make, and model properties
     */
    function extractVehicleFromText(text) {
        console.log("Analyzing text for vehicle information:", text);
        
        // If no text provided, return empty result
        if (!text || text.trim() === "") {
            return { hasVehicle: false, modelExplicitlyMentioned: false };
        }
        
        const modelYears = Array.from({ length: 25 }, (_, i) => (2025 - i).toString());
        
        // Extract year (look for 4-digit number between 1990 and 2025)
        let year = null;
        const yearMatch = text.match(/\b(19[9][0-9]|20[0-2][0-9])\b/);
        if (yearMatch) {
            year = yearMatch[0];
            console.log("Year detected in text:", year);
        }
        
        // Common vehicle makes with variations
        const makes = {
            "Honda": ["honda"],
            "Toyota": ["toyota"],
            "Ford": ["ford"],
            "Chevrolet": ["chevrolet", "chevy"],
            "Nissan": ["nissan"],
            "Hyundai": ["hyundai"],
            "Kia": ["kia"],
            "Subaru": ["subaru"],
            "Mazda": ["mazda"],
            "BMW": ["bmw"],
            "Mercedes": ["mercedes", "mercedes-benz", "mercedes benz"],
            "Lexus": ["lexus"],
            "Acura": ["acura"],
            "Audi": ["audi"],
            "Volkswagen": ["volkswagen", "vw"],
            "Volvo": ["volvo"],
            "Jeep": ["jeep"],
            "Chrysler": ["chrysler"],
            "Dodge": ["dodge"],
            "Buick": ["buick"],
            "Cadillac": ["cadillac"],
            "GMC": ["gmc"],
            "Lincoln": ["lincoln"],
            "Infiniti": ["infiniti"],
            "Mitsubishi": ["mitsubishi"],
            "Porsche": ["porsche"],
            "Land Rover": ["land rover", "landrover"],
            "Jaguar": ["jaguar"],
            "Tesla": ["tesla"],
            "Genesis": ["genesis"],
            "RAM": ["ram", "dodge ram"]
        };
        
        // Find make in text
        let make = null;
        let makeIndex = Number.MAX_SAFE_INTEGER;
        
        for (const [makeName, variations] of Object.entries(makes)) {
            for (const variation of variations) {
                // Look for the variation as a whole word
                const regex = new RegExp(`\\b${variation}\\b`, 'i');
                const match = text.match(regex);
                if (match && match.index < makeIndex) {
                    make = makeName;
                    makeIndex = match.index;
                }
            }
        }
        
        console.log("Make detected in text:", make);
        
        // Expanded models for common makes (organized by make for more accurate matching)
        const modelsByMake = {
            "Honda": ["accord", "civic", "cr-v", "crv", "pilot", "odyssey", "fit", "hr-v", "hrv", "ridgeline", "passport", "insight", "clarity", "element", "s2000"],
            "Toyota": ["camry", "corolla", "rav4", "rav-4", "highlander", "tacoma", "tundra", "4runner", "four runner", "sienna", "prius", "avalon", "venza", "c-hr", "chr", "sequoia", "land cruiser", "gr86", "supra", "mirai", "yaris", "matrix"],
            "Ford": ["f-150", "f150", "f-250", "f250", "f-350", "f350", "f-450", "f450", "f-550", "f550", "f-series", "f series", "mustang", "escape", "explorer", "edge", "expedition", "ranger", "fusion", "focus", "bronco", "maverick", "ecosport", "mach-e", "mach e", "transit", "super duty"],
            "Chevrolet": ["silverado", "1500", "2500", "3500", "malibu", "equinox", "tahoe", "suburban", "traverse", "cruze", "impala", "camaro", "colorado", "blazer", "trailblazer", "bolt", "spark", "sonic", "trax", "corvette"],
            "Nissan": ["altima", "sentra", "rogue", "pathfinder", "murano", "maxima", "frontier", "titan", "armada", "versa", "kicks", "juke", "leaf", "z", "370z", "350z", "gt-r", "gtr"],
            "Hyundai": ["elantra", "sonata", "tucson", "santa fe", "santa", "kona", "palisade", "accent", "venue", "veloster", "ioniq", "nexo", "santa cruz"],
            "Kia": ["optima", "k5", "sportage", "sorento", "telluride", "forte", "soul", "seltos", "carnival", "stinger", "niro", "rio", "ev6", "cadenza"],
            "Subaru": ["outback", "forester", "impreza", "legacy", "crosstrek", "ascent", "wrx", "brz", "sti", "baja", "tribeca"],
            "Mazda": ["mazda3", "mazda 3", "mazda6", "mazda 6", "cx-5", "cx5", "cx-9", "cx9", "mx-5", "mx5", "cx-30", "cx30", "cx-3", "cx3", "cx-50", "cx50", "cx-90", "cx90", "miata", "rx-8", "rx8"],
            "BMW": ["3-series", "3 series", "5-series", "5 series", "7-series", "7 series", "x1", "x3", "x5", "x7", "m3", "m5", "m8", "i3", "i4", "i7", "i8", "z4", "8-series", "8 series", "4-series", "4 series", "2-series", "2 series"],
            "Mercedes": ["c-class", "c class", "e-class", "e class", "s-class", "s class", "a-class", "a class", "glc", "gle", "gls", "g-class", "g class", "cla", "cls", "sl", "glb", "gla", "amg"],
            "Audi": ["a3", "a4", "a5", "a6", "a7", "a8", "q3", "q5", "q7", "q8", "e-tron", "etron", "tt", "r8", "rs6", "rs7", "s3", "s4", "s5", "s6", "s7", "s8"],
            "Volkswagen": ["jetta", "passat", "tiguan", "atlas", "golf", "gti", "gli", "id.4", "id4", "taos", "arteon", "beetle", "eos", "touareg", "cc"],
            "RAM": ["1500", "2500", "3500", "promaster", "ram 1500", "ram 2500", "ram 3500", "ram promaster"],
            "Jeep": ["wrangler", "grand cherokee", "cherokee", "compass", "renegade", "gladiator", "wagoneer", "grand wagoneer"]
        };
        
        // Expanded generic models with more variations including frequent typos and alternative forms
        const genericModels = [
            // BMW
            "3-series", "3 series", "3series", "3-serie", "5-series", "5 series", "5series", "5-serie",
            "x1", "x2", "x3", "x4", "x5", "x6", "x7", "m3", "m4", "m5", "m8", 
            // Audi
            "a1", "a2", "a3", "a4", "a5", "a6", "a7", "a8", "a-4", "a-6",
            "q1", "q2", "q3", "q4", "q5", "q6", "q7", "q8", "q-5", "q-7",
            "s3", "s4", "s5", "s6", "s7", "s8", "rs3", "rs4", "rs5", "rs6", "rs7",
            "e-tron", "etron", "e tron", "tt", "r8",
            // Mercedes
            "e-class", "e class", "eclass", "c-class", "c class", "cclass", 
            "s-class", "s class", "sclass", "a-class", "a class", "aclass",
            "gle", "glc", "gls", "gla", "glb", "sl", "cls", "cla", "amg",
            // Lexus
            "es", "gs", "is", "ls", "nx", "rx", "ux", "lx", "rc", "lc", "gx",
            // Acura
            "mdx", "rdx", "tlx", "ilx", "nsx", "rlx", "zdx", "tl", "tsx", "integra",
            // Infiniti
            "q50", "q60", "qx50", "qx55", "qx60", "qx80", 
            // Volvo
            "xc40", "xc60", "xc90", "s60", "s90", "v60", "v90",
            // Jeep
            "wrangler", "grand cherokee", "cherokee", "compass", "renegade", "gladiator",
            // Chrysler
            "pacifica", "300", "300c",
            // Dodge/RAM
            "charger", "challenger", "durango", "ram 1500", "ram 2500", "ram 3500", "1500", "2500", "3500",
            // GM
            "enclave", "envision", "encore", "ct4", "ct5", "xt4", "xt5", "xt6", "escalade", 
            "sierra", "acadia", "terrain", "yukon", "silverado 1500", "silverado 2500", "silverado 3500",
            // Ford
            "f-150", "f-250", "f-350", "f150", "f250", "f350", "f 150", "f 250", "f 350",
            // Lincoln
            "navigator", "aviator", "corsair", "nautilus",
            // Mitsubishi
            "outlander", "eclipse cross", "mirage", "outlander sport",
            // Tesla
            "model 3", "model y", "model s", "model x", "cybertruck", "roadster",
            // Genesis
            "g70", "g80", "g90", "gv70", "gv80"
        ];

        // Function to check if text contains a model with flexibility
        function containsModel(text, modelName) {
            // Check several variations of the model name
            const variations = [
                modelName,
                modelName.toLowerCase(),
                modelName.toUpperCase(),
                modelName.charAt(0).toUpperCase() + modelName.slice(1).toLowerCase(),
                modelName.replace(/[-\s]/g, ''),
                modelName.replace(/[-\s]/g, '-'),
                modelName.replace(/[-\s]/g, ' ')
            ];
            
            for (const variant of variations) {
                // Try exact word match first
                const wordRegex = new RegExp(`\\b${variant}\\b`, 'i');
                if (wordRegex.test(text)) {
                    return { match: true, variant: variant, exact: true };
                }
                
                // Then try contains (for complex model names that might be split across words)
                if (text.toLowerCase().includes(variant.toLowerCase())) {
                    return { match: true, variant: variant, exact: false };
                }
            }
            
            return { match: false };
        }
        
        // Find model in text
        let model = null;
        let modelIndex = Number.MAX_SAFE_INTEGER;
        let modelExactMatch = false;
        let modelExplicitlyMentioned = false;
        
        // First, prioritize models for the detected make
        if (make && modelsByMake[make]) {
            for (const modelName of modelsByMake[make]) {
                // More flexible model matching
                const regex = new RegExp(`\\b${modelName.replace(/-/g, '[- ]?')}\\b`, 'i');
                const match = text.match(regex);
                
                if (match && match.index < modelIndex) {
                    model = modelName;
                    modelIndex = match.index;
                    modelExactMatch = true;
                    modelExplicitlyMentioned = true;
                    console.log(`Found make-specific model "${modelName}" at position ${match.index}`);
                }
                
                // Also try a more flexible content-based match if no exact match found
                if (!modelExactMatch) {
                    const containsResult = containsModel(text, modelName);
                    if (containsResult.match) {
                        // Find the position of this model in the text
                        const variantPos = text.toLowerCase().indexOf(containsResult.variant.toLowerCase());
                        if (variantPos >= 0 && variantPos < modelIndex) {
                            model = modelName;
                            modelIndex = variantPos;
                            modelExactMatch = containsResult.exact;
                            modelExplicitlyMentioned = true;
                            console.log(`Found make-specific model "${modelName}" (variant: ${containsResult.variant}) at position ${variantPos}`);
                        }
                    }
                }
            }
        }
        
        // If no model found for this make, try generic models
        if (!model) {
            for (const modelName of genericModels) {
                const containsResult = containsModel(text, modelName);
                if (containsResult.match) {
                    // Find the position of this model in the text
                    const variantPos = text.toLowerCase().indexOf(containsResult.variant.toLowerCase());
                    if (variantPos >= 0 && variantPos < modelIndex) {
                        model = modelName;
                        modelIndex = variantPos;
                        modelExactMatch = containsResult.exact;
                        modelExplicitlyMentioned = true;
                        console.log(`Found generic model "${modelName}" (variant: ${containsResult.variant}) at position ${variantPos}`);
                    }
                }
            }
        }
        
        console.log("Model detected in text:", model, modelExplicitlyMentioned ? "(explicitly mentioned)" : "(not explicitly mentioned)");
        
        // Determine if we have a valid vehicle reference
        const hasVehicle = Boolean(year || make || model);
        
        return {
            year: year,
            make: make,
            model: model,
            hasVehicle: hasVehicle,
            modelExplicitlyMentioned: modelExplicitlyMentioned
        };
    }
    
    /**
     * Update the vehicle dropdowns with extracted information
     * @param {object} vehicleInfo - Object with year, make, and model properties
     */
    function updateVehicleDropdowns(vehicleInfo) {
        console.log("Updating dropdowns with vehicle info:", vehicleInfo);
        
        // Get dropdown elements
        const yearDropdown = document.getElementById('yearSelect');
        const makeDropdown = document.getElementById('makeSelect');
        const modelDropdown = document.getElementById('modelSelect');
        
        if (!yearDropdown || !makeDropdown || !modelDropdown) {
            console.error("Could not find all dropdown elements");
            return;
        }
        
        // Initialize or update vehicle context
        if (!window.vehicleContext) {
            window.vehicleContext = {};
        }
        
        // Update year dropdown if found
        if (vehicleInfo.year) {
            const yearOption = Array.from(yearDropdown.options)
                .find(option => option.value === vehicleInfo.year);
            
            if (yearOption) {
                // Only update if it's a different value (prevent triggering unnecessary change events)
                if (yearDropdown.value !== vehicleInfo.year) {
                    yearDropdown.value = vehicleInfo.year;
                    // Store in context
                    window.vehicleContext.year = vehicleInfo.year;
                    console.log("Updated year dropdown to:", vehicleInfo.year);
                    // Trigger change event to update other dropdowns if needed
                    yearDropdown.dispatchEvent(new Event('change'));
                }
            } else {
                console.log(`Year ${vehicleInfo.year} not found in dropdown options`);
                // Still store in context even if not in dropdown
                window.vehicleContext.year = vehicleInfo.year;
            }
        }
        
        // Update make dropdown if found
        if (vehicleInfo.make) {
            const makeOption = Array.from(makeDropdown.options)
                .find(option => option.value === vehicleInfo.make);
            
            if (makeOption) {
                // Check if this is a change from current value
                if (makeDropdown.value !== vehicleInfo.make) {
                    makeDropdown.value = vehicleInfo.make;
                    // Store in context
                    window.vehicleContext.make = vehicleInfo.make;
                    console.log("Updated make dropdown to:", vehicleInfo.make);
                    // Trigger change event to update model options
                    makeDropdown.dispatchEvent(new Event('change'));
                    
                    // IMPORTANT: If the make changes but no model was explicitly mentioned,
                    // clear any existing model selection to prevent incorrect assumptions
                    if (!vehicleInfo.modelExplicitlyMentioned && modelDropdown.value) {
                        console.log("Clearing model dropdown as make changed and no model was explicitly mentioned");
                        setTimeout(() => {
                            modelDropdown.value = '';
                            window.vehicleContext.model = '';
                        }, 300); // Wait for model dropdown to be populated with new models
                    }
                }
            } else {
                console.log(`Make ${vehicleInfo.make} not found in dropdown options`);
                // Still store in context even if not in dropdown
                window.vehicleContext.make = vehicleInfo.make;
            }
        }
        
        // Update model dropdown if found AND explicitly mentioned
        if (vehicleInfo.model && vehicleInfo.modelExplicitlyMentioned) {
            console.log("Model explicitly mentioned, updating dropdown");
            // Since model options depend on make, we need to wait for make changes to propagate
            // Use a timeout to allow the make dropdown change event to update model options
            setTimeout(() => {
                if (modelDropdown.options.length <= 1) {
                    console.log("Waiting for model options to load...");
                    // If models haven't loaded yet, try again in a moment
                    setTimeout(() => updateModelDropdown(vehicleInfo.model), 500);
                    return;
                }
                
                updateModelDropdown(vehicleInfo.model);
            }, 300);
        } else if (vehicleInfo.model && !vehicleInfo.modelExplicitlyMentioned) {
            console.log("Model found but NOT explicitly mentioned, not updating dropdown");
        }
        
        // Helper function to update the model dropdown
        function updateModelDropdown(modelToSet) {
            // First try exact match
            let modelOption = Array.from(modelDropdown.options)
                .find(option => option.value.toLowerCase() === modelToSet.toLowerCase());
            
            // If no exact match, try case-insensitive includes match
            if (!modelOption) {
                modelOption = Array.from(modelDropdown.options)
                    .find(option => 
                        option.value.toLowerCase().includes(modelToSet.toLowerCase()) || 
                        modelToSet.toLowerCase().includes(option.value.toLowerCase())
                    );
            }
            
            if (modelOption) {
                modelDropdown.value = modelOption.value;
                window.vehicleContext.model = modelOption.value;
                console.log("Updated model dropdown to:", modelOption.value);
                // Trigger change event
                modelDropdown.dispatchEvent(new Event('change'));
            } else {
                console.log(`Model ${modelToSet} not found in dropdown options`);
                // Still store in context even if not in dropdown
                window.vehicleContext.model = modelToSet;
            }
        }
    }
}); 