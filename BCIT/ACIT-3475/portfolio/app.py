from flask import Flask, render_template, request, redirect, url_for, session, flash

app = Flask(__name__)
# Set your secret key – use an environment variable or secure method in production.
app.secret_key = 'your_secret_key_here'

# Hardcoded user credentials for demonstration purposes.
users = {
    "admin": "password123"  # username: password
}

@app.route('/')
def portfolio():
    # Render the public landing page which contains your portfolio HTML.
    return render_template('portfolio.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    # If a logged-in user visits the login page, optionally redirect them.
    if session.get('logged_in'):
        flash("You are already logged in.", "info")
        return redirect(url_for('admin'))

    if request.method == 'POST':
        # Retrieve submitted form data.
        username = request.form.get('username')
        password = request.form.get('password')

        # Verify credentials using the hardcoded users dict.
        if username in users and users[username] == password:
            session['logged_in'] = True
            session['username'] = username  # Store additional user data if needed.
            flash("Logged in successfully!", "success")
            return redirect(url_for('admin'))
        else:
            flash("Invalid credentials, please try again.", "error")
    
    return render_template('login.html')

@app.route('/admin')
def admin():
    # Check if the user is logged in.
    if not session.get('logged_in'):
        flash("Please log in first.", "error")
        return redirect(url_for('login'))
    # Render a protected admin/dashboard page.
    return render_template('admin.html', username=session.get('username'))

@app.route('/logout')
def logout():
    # Clear the session to log the user out.
    session.clear()
    flash("You have been logged out.", "info")
    return redirect(url_for('portfolio'))

if __name__ == '__main__':
    app.run(debug=True)
