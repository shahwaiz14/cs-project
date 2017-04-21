
from flask import Flask # Import Flask package
from flask import render_template # Import render_template function
app = Flask(__name__) # Construct Flask object named 'app'

@app.route('/') # URL for function (default for home page)
def index():
	return render_template('index.html') # located in templates/

@app.route('/about')
def about():
        return render_template('about.html')


# Dropdown links for brands menu
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
        
#categories
        

@app.route('/categories.html')
def categories():
        return render_template('categories.html')


@app.route('/categories.html')
def cTest():
        return render_template('/categories.html')

@app.route('/TVHomeTheater')
def TVHomeTheater():
        return render_template('TVHomeTheater.html')
        
@app.route('/CellPhones')
def CellPhones():
        return render_template('CellPhones.html')
 
@app.route('/computertablets')
def computertablets():
        return render_template('computertablets.html')
        
@app.route('/printer')
def printer():
        return render_template('printer.html')
 
@app.route('/GamingConsole')
def GamingConsole():
        return render_template('GamingConsole.html')
 
@app.route('/tablets')
def tablets():
        return render_template('tablets.html')
 


# Products Drop Down Links
@app.route('/products')
def products():
        return render_template('products.html')
        
@app.route('/iphone')
def iphone():
        return render_template('iphone.html')
 
@app.route('/samsungtv')
def samsungtv():
        return render_template('samsungtv.html')
        
@app.route('/dellalienware')
def dellalienware():
        return render_template('dellalienware.html')
 
@app.route('/hpenvy')
def hpenvy():
        return render_template('hpenvy.html')
 
@app.route('/lgg')
def lgg():
        return render_template('lgg.html')
 
 
@app.route('/xboxones')
def xboxones():
        return render_template('xboxones.html')


        
if __name__ == '__main__':
        app.run('127.0.0.1', '5000')
		#app.run('174.138.78.41', '80') # Run application


##@app.route('/brands.html')
##def brands():
##        return render_template('pillars_pages/brands.html')
        
