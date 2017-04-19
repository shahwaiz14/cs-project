
from flask import Flask # Import Flask package
from flask import render_template # Import render_template function
app = Flask(__name__) # Construct Flask object named 'app'

@app.route('/') # URL for function (default for home page)
#@app.route('/index') # Secondary URL for function
def index():
	return render_template('index.html') # located in templates/

@app.route('/a')
def about():
        return render_template('about.html')


@app.route('/brands.html')
def brands():
        return render_template('pillars_pages/brands.html')
        
if __name__ == '__main__':
	app.run() # Run application
