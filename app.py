
from flask import Flask # Import Flask package
from flask import render_template # Import render_template function
app = Flask(__name__) # Construct Flask object named 'app'

@app.route('/') # URL for function (default for home page)
def index():
	return render_template('index.html') # located in templates/

@app.route('/about')
def about():
        return render_template('about.html')

@app.route('/brands.html')
def brands():
        return render_template('brands.html')


@app.route('/apple')
def apple():
        return render_template('apple.html')


@app.route('/samsung')
def samsung():
        return render_template('samsung.html')


@app.route('/hp')
def hp():
        return render_template('hp.html')

@app.route('/intel')
def intel():
        return render_template('intel.html')


@app.route('/lg')
def lg():
        return render_template('lg.html')

@app.route('/microsoft')
def microsoft():
        return render_template('microsoft.html')



##@app.route('/brands.html')
##def brands():
##        return render_template('pillars_pages/brands.html')
        
if __name__ == '__main__':
	app.run() # Run application
