import os
import sys
import google.generativeai as genai
from dotenv import load_dotenv

def test_gemini():
    print("Starting API test...")
    print(f"Python version: {sys.version}")
    print(f"Google GenerativeAI version: {genai.__version__}")
    
    # Load environment variables
    load_dotenv()
    print("\nEnvironment variables loaded")
    
    # Get and verify API key
    api_key = os.getenv('GOOGLE_API_KEY')
    if not api_key:
        print("Error: GOOGLE_API_KEY not found in .env file")
        return
    
    print(f"API Key found: {api_key[:5]}...")
    
    try:
        # Configure the library
        print("\nConfiguring API...")
        genai.configure(api_key=api_key)
        print("Configuration successful")
        
        # Try to create a model instance
        print("\nCreating model instance...")
        model = genai.GenerativeModel('models/gemini-1.5-flash')
        print("Model instance created successfully")
        
        # Try a simple prompt
        test_prompt = """
        Given this vehicle information:
        2023 Honda Accord - Front Radar: Static Calibration | Requires level surface, target board
        
        Please explain the calibration requirements in a brief response.
        """
        print("\nSending test prompt...")
        
        response = model.generate_content(test_prompt)
        print("\nResponse received:")
        print(response.text)
        
        print("\nTest completed successfully!")
        
    except Exception as e:
        print(f"\nError during test: {str(e)}")
        print(f"Error type: {type(e).__name__}")
        import traceback
        print("\nFull traceback:")
        traceback.print_exc()

if __name__ == "__main__":
    test_gemini() 