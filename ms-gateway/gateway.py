import json
import requests

from flask import Flask
from flask import render_template
from flask import request
from flask import Response
from flask import session

from config import http_addr


app = Flask(__name__)

# Encrypt sessions with this
from secret_key import secret_key
app.secret_key = secret_key


# Landing page with suggested news and user info
@app.route('/')
def index():
	if 'user_id' in session:
		# retrieve existing user
		user = requests.get(
			'%s/users/get' % http_addr('ms-user-mgmt'),
			params={'id': session['user_id']}
		).json()

		user['is_new'] = False

	else:
		# save new user
		user = requests.post(
			'%s/users/add' % http_addr('ms-user-mgmt'),
			data={}
		).json()

		user['is_new'] = True

		# store id in session
		session['user_id'] = user['id']

	# retrieve news
	items = [
		{
			'title': 'Masters: Tiger Woods, Rory McIlroy, Justin Rose tee times announced',
			'subtitle': 'Four-time winner Tiger Woods will be among the early starters when the Masters at Augusta begins on Thursday.',
			'image': 'https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/01E8/production/_100688400_tiger_reuters.jpg',
			'link': 'http://www.bbc.com/sport/golf/43634645',

			'source': {
				'name': 'TechCrunch',
				'link': 'https://techcrunch.com',
				'icon': 'http://bocacommunications.com/wp-content/uploads/2017/07/TechCrunch-Logo.jpg'
			}
		},
		{
			'title': 'New Zealand v England: Ish Sodhi guides hosts to draw and series win',
			'subtitle': 'New Zealand held their nerve to secure a dramatic draw against England in the second Test in Christchurch and claim a 1-0 series victory.',
			'image': 'https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/12DF0/production/_100669277_englandfield_getty.jpg',
			'link': 'http://www.bbc.com/sport/cricket/43624239',

			'source': {
				'name': 'BBC',
				'link': 'http://bbc.com',
				'icon': 'http://icons.iconarchive.com/icons/martz90/circle/512/bbc-news-icon.png'
			}
		},
		{
			'title': 'Miami Open: John Isner beats Alexander Zverev to win first Masters 1,000 title',
			'subtitle': 'American John Isner won his first ever Masters 1,000 title with a 6-7 (4-7) 6-4 6-4 victory over German Alexander Zverev in the Miami Open final.',
			'image': 'https://ichef.bbci.co.uk/onesport/cps/800/cpsprodpb/17ABB/production/_100655969_isner_reuters.jpg',
			'link': 'http://www.bbc.com/sport/tennis/43613957',

			'source': {
				'name': 'TechCrunch',
				'link': 'https://techcrunch.com',
				'icon': 'http://bocacommunications.com/wp-content/uploads/2017/07/TechCrunch-Logo.jpg'
			}
		}
	] * 4

	return render_template('news.html', user=user, items=items)


# User clicked on news item to read
@app.route('/set_user_name', methods=['POST'])
def set_user_name():
	if 'user_id' not in session:
		abort(401)

	user_name = request.form.get('user_name', '').strip()
	if user_name == '':
		# return as invalid
		data = {
			'user_name': '',
			'is_valid': False,
		}

	else:
		# save to ms-user-mgmt & return as valid
		requests.post(
			'%s/users/edit' % http_addr('ms-user-mgmt'),
			data={'id': session['user_id'], 'name': user_name}
		).json()

		data = {
			'user_name': user_name,
			'is_valid': True,
		}

	return Response(
		json.dumps(data),
		status=200,
		mimetype='application/json'
	)


# User clicked on news item to read
@app.route('/item_clicked', methods=['POST'])
def item_clicked():
	if 'user_id' not in session:
		abort(401)

	return 'All tags of the news incremented for user'


# User removed the news item from feed
@app.route('/item_removed', methods=['POST'])
def item_removed():
	if 'user_id' not in session:
		abort(401)

	return 'All tags of the news decremented for user'
