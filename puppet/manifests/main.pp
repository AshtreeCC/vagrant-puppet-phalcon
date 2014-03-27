stage { 'prepare': 
	before => Stage['main'] 
}

class {
	'bootstrap':      stage => prepare;
	'tools':          stage => main;
	'php':            stage => main;
	'nginx':          stage => main;
	'mysql':          stage => main;
	'composer':       stage => main;
	'phalcon':        stage => main;
}

addServer {'phalcon':
	site => 'phalcon.dev',
	root => '/vagrant/www/'
}

addServer {'media':
	site => 'media.dev',
	root => '/vagrant/www/media.dev/public/'
}

addServer {'jink':
	site => 'jink.dev',
	root => '/vagrant/www/jink.dev/public/'
}

addServer {'panda.admin':
	site => 'admin.ponderingpanda.dev',
	root => '/vagrant/www/admin.ponderingpanda.dev/public/'
}

addMysql { 'jink_db':
    user => 'jink_usr',
    password => 'jink_pass'
}

addMysql { 'pp_admin_db':
    user => 'panda_usr',
    password => 'panda_pass'
}