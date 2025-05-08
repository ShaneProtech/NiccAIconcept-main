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
        const result = {
            year: null,
            make: null,
            model: null
        };
        
        // Extract year (4 digits between 1990-2024)
        const yearRegex = /\b(19[9][0-9]|20[0-2][0-9])\b/g;
        const yearMatch = text.match(yearRegex);
        if (yearMatch) {
            // Use the first year found
            result.year = yearMatch[0];
        }
        
        // Common vehicle makes (patterns to match in text)
        const makePatterns = {
            'Honda': /\bhonda\b/i,
            'Toyota': /\btoyota\b/i,
            'Ford': /\bford\b/i,
            'Chevrolet': /\b(chevy|chevrolet)\b/i,
            'Nissan': /\bnissan\b/i,
            'Hyundai': /\bhyundai\b/i,
            'Kia': /\bkia\b/i,
            'Jeep': /\bjeep\b/i,
            'BMW': /\bbmw\b/i,
            'Mercedes-Benz': /\b(mercedes|benz|mercedes[\s-]benz)\b/i,
            'Audi': /\baudi\b/i,
            'Lexus': /\blexus\b/i,
            'Acura': /\bacura\b/i,
            'Mazda': /\bmazda\b/i,
            'Subaru': /\bsubaru\b/i,
            'Volkswagen': /\b(vw|volkswagen)\b/i,
            'Volvo': /\bvolvo\b/i,
            'Cadillac': /\bcadillac\b/i,
            'Buick': /\bbuick\b/i,
            'GMC': /\bgmc\b/i,
            'Chrysler': /\bchrysler\b/i,
            'Dodge': /\bdodge\b/i,
            'Ram': /\bram\b/i,
            'Lincoln': /\blincoln\b/i,
            'Infiniti': /\binfiniti\b/i,
            'Genesis': /\bgenesis\b/i,
            'Land Rover': /\b(land rover|range rover)\b/i,
            'Jaguar': /\bjaguar\b/i,
            'Porsche': /\bporsche\b/i,
            'Tesla': /\btesla\b/i,
            'Mitsubishi': /\bmitsubishi\b/i,
            'MINI': /\bmini\b/i,
            'Fiat': /\bfiat\b/i
        };
        
        // Check for make matches
        for (const [make, pattern] of Object.entries(makePatterns)) {
            if (pattern.test(text)) {
                result.make = make;
                break;
            }
        }
        
        // Common model patterns by make
        const modelPatterns = {
            'Honda': {
                'Accord': /\baccord\b/i,
                'Civic': /\bcivic\b/i,
                'CR-V': /\b(cr-?v|crv)\b/i,
                'Pilot': /\bpilot\b/i,
                'Odyssey': /\bodyssey\b/i,
                'HR-V': /\b(hr-?v|hrv)\b/i,
                'Ridgeline': /\bridgeline\b/i
            },
            'Toyota': {
                'Camry': /\bcamry\b/i,
                'Corolla': /\bcorolla\b/i,
                'RAV4': /\b(rav4|rav-?4)\b/i,
                'Highlander': /\bhighlander\b/i,
                'Tacoma': /\btacoma\b/i,
                'Tundra': /\btundra\b/i,
                'Sienna': /\bsienna\b/i,
                '4Runner': /\b4[-\s]?runner\b/i,
                'Prius': /\bprius\b/i
            },
            'Ford': {
                'F-150': /\b(f[-\s]?150|f150)\b/i,
                'Escape': /\bescape\b/i,
                'Explorer': /\bexplorer\b/i,
                'Mustang': /\bmustang\b/i,
                'Edge': /\bedge\b/i,
                'Ranger': /\branger\b/i,
                'Expedition': /\bexpedition\b/i,
                'Bronco': /\bbronco\b/i
            },
            'Chevrolet': {
                'Silverado': /\bsilverado\b/i,
                'Equinox': /\bequinox\b/i,
                'Malibu': /\bmalibu\b/i,
                'Tahoe': /\btahoe\b/i,
                'Suburban': /\bsuburban\b/i,
                'Traverse': /\btraverse\b/i,
                'Colorado': /\bcolorado\b/i,
                'Camaro': /\bcamaro\b/i,
                'Corvette': /\bcorvette\b/i
            },
            'Nissan': {
                'Altima': /\baltima\b/i,
                'Sentra': /\bsentra\b/i,
                'Rogue': /\brogue\b/i,
                'Pathfinder': /\bpathfinder\b/i,
                'Frontier': /\bfrontier\b/i,
                'Murano': /\bmurano\b/i,
                'Maxima': /\bmaxima\b/i,
                'Titan': /\btitan\b/i,
                'Kicks': /\bkicks\b/i
            },
            'Hyundai': {
                'Elantra': /\belantra\b/i,
                'Sonata': /\bsonata\b/i,
                'Tucson': /\btucson\b/i,
                'Santa Fe': /\bsanta[-\s]?fe\b/i,
                'Kona': /\bkona\b/i,
                'Palisade': /\bpalisade\b/i,
                'Venue': /\bvenue\b/i,
                'Accent': /\baccent\b/i
            },
            'Kia': {
                'Sorento': /\bsorento\b/i,
                'Sportage': /\bsportage\b/i,
                'Forte': /\bforte\b/i,
                'Soul': /\bsoul\b/i,
                'Telluride': /\btelluride\b/i,
                'Optima': /\boptima\b/i,
                'K5': /\bk5\b/i,
                'Seltos': /\bseltos\b/i
            }
        };
        
        // If we found a make, check for models from that make
        if (result.make && modelPatterns[result.make]) {
            for (const [model, pattern] of Object.entries(modelPatterns[result.make])) {
                if (pattern.test(text)) {
                    result.model = model;
                    break;
                }
            }
        } else {
            // If no make found or a make without model patterns, check all models
            for (const makeModels of Object.values(modelPatterns)) {
                for (const [model, pattern] of Object.entries(makeModels)) {
                    if (pattern.test(text)) {
                        result.model = model;
                        // If we found a model but no make, try to infer the make
                        if (!result.make) {
                            for (const [make, models] of Object.entries(modelPatterns)) {
                                if (model in models) {
                                    result.make = make;
                                    break;
                                }
                            }
                        }
                        break;
                    }
                }
                if (result.model) break;
            }
        }
        
        return result;
    }
    
    /**
     * Update the vehicle dropdowns with extracted information
     * @param {object} vehicleInfo - Object with year, make, and model properties
     */
    function updateVehicleDropdowns(vehicleInfo) {
        const yearSelect = document.getElementById('yearSelect');
        const makeSelect = document.getElementById('makeSelect');
        const modelSelect = document.getElementById('modelSelect');
        
        if (!yearSelect || !makeSelect || !modelSelect) {
            console.error('Vehicle dropdowns not found in the DOM');
            return;
        }
        
        // Update year if found and the dropdown has that option
        if (vehicleInfo.year) {
            const yearOption = Array.from(yearSelect.options).find(opt => opt.value === vehicleInfo.year);
            if (yearOption) {
                yearSelect.value = vehicleInfo.year;
                console.log('Updated year dropdown to', vehicleInfo.year);
            }
        }
        
        // Update make if found and the dropdown has that option
        if (vehicleInfo.make) {
            const makeOption = Array.from(makeSelect.options).find(opt => 
                opt.value.toLowerCase() === vehicleInfo.make.toLowerCase() ||
                opt.text.toLowerCase() === vehicleInfo.make.toLowerCase()
            );
            
            if (makeOption) {
                makeSelect.value = makeOption.value;
                console.log('Updated make dropdown to', vehicleInfo.make);
                
                // Trigger change event to load models for this make
                const event = new Event('change');
                makeSelect.dispatchEvent(event);
                
                // Wait for models to load before trying to set the model
                if (vehicleInfo.model) {
                    setTimeout(() => {
                        updateModelDropdown(vehicleInfo.model);
                    }, 500);
                }
            }
        }
        
        // If no make change but we have a model, try to update the model directly
        if (vehicleInfo.model && !vehicleInfo.make) {
            updateModelDropdown(vehicleInfo.model);
        }
    }
    
    /**
     * Update the model dropdown with the extracted model
     * @param {string} model - The model to select
     */
    function updateModelDropdown(model) {
        const modelSelect = document.getElementById('modelSelect');
        if (!modelSelect) return;
        
        // First try exact match
        let modelOption = Array.from(modelSelect.options).find(opt => 
            opt.value.toLowerCase() === model.toLowerCase() ||
            opt.text.toLowerCase() === model.toLowerCase()
        );
        
        // If exact match not found, try partial match
        if (!modelOption) {
            modelOption = Array.from(modelSelect.options).find(opt => 
                opt.text.toLowerCase().includes(model.toLowerCase()) ||
                model.toLowerCase().includes(opt.text.toLowerCase())
            );
        }
        
        if (modelOption) {
            modelSelect.value = modelOption.value;
            console.log('Updated model dropdown to', model);
            
            // Trigger change event
            const event = new Event('change');
            modelSelect.dispatchEvent(event);
        }
    }
}); 