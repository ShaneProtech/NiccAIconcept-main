import subprocess
import time
import sys
import os

def restart_flask_app():
    """
    Restart the Flask application by killing any existing python processes 
    and starting a new instance of app.py
    """
    print("Restarting Flask application...")
    
    # Find and kill any existing Flask processes
    try:
        # On Windows, use taskkill to end any running python processes
        if sys.platform == "win32":
            subprocess.run("taskkill /f /im python.exe", shell=True)
        else:
            # On Unix systems, use pkill
            subprocess.run("pkill -f 'python app.py'", shell=True)
    except Exception as e:
        print(f"Error killing existing processes: {str(e)}")
    
    # Wait a moment for processes to terminate
    time.sleep(2)
    
    # Start the Flask app
    print("Starting new Flask instance...")
    try:
        # Start the Flask app as a separate process
        flask_process = subprocess.Popen(
            ["python", "app.py"], 
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            text=True
        )
        
        # Wait a moment and check if the process is still running
        time.sleep(3)
        if flask_process.poll() is None:
            print("Flask application started successfully!")
            print(f"Process ID: {flask_process.pid}")
            
            # Monitor output for a few seconds to catch any startup errors
            print("Monitoring output for 5 seconds...")
            for _ in range(5):
                stdout_line = flask_process.stdout.readline()
                stderr_line = flask_process.stderr.readline()
                
                if stdout_line:
                    print(f"[Flask] {stdout_line.strip()}")
                if stderr_line:
                    print(f"[Flask Error] {stderr_line.strip()}")
                    
                time.sleep(1)
                
                # Check if process is still running
                if flask_process.poll() is not None:
                    print(f"Flask process terminated with exit code: {flask_process.returncode}")
                    break
            
            print("Flask application is now running in the background.")
            print("Access the application at http://localhost:5000")
        else:
            # Process terminated immediately - something went wrong
            stdout, stderr = flask_process.communicate()
            print(f"Flask application failed to start!")
            print(f"Error output: {stderr}")
    
    except Exception as e:
        print(f"Error starting Flask application: {str(e)}")

if __name__ == "__main__":
    restart_flask_app() 