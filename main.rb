# 1. Establish the Application Path
APP_ROOT = File.dirname(__FILE__)             

# 2. Look for file globally 
$:.unshift(File.join(APP_ROOT,'user'))

# 3. Include the guide file 
require 'app_guide'

# 4. Create new App Guide 
app_guide = AppGuide.new 

# 5. Run the App
app_guide.run_medirecord!


