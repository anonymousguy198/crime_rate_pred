import sys
import site
site.addsitedir('/home/ubuntu/.local/lib/python3.6/site-packages')
sys.path.insert(0, '/var/www/html/proj/')
from app import app as application
