stage { 'prepare': 
	before => Stage['main'] 
}

class {
	'bootstrap':      stage => prepare;
	'tools':          stage => prepare;
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

addServer {'sophia.admin':
	site => 'admin.sophiazemi.dev',
	root => '/vagrant/www/admin.sophiazemi.dev/public/'
}

addServer {'panda.admin':
	site => 'admin.ponderingpanda.dev',
	root => '/vagrant/www/admin.ponderingpanda.dev/public/'
}

addMysql { 'jink_db':
    user => 'jink_usr',
    password => 'jink_pass'
}

addMysql { 'media_db':
    user => 'media_usr',
    password => 'media_pass'
}

addMysql { 'sz_admin_db':
    user => 'sz_admin_usr',
    password => 'sz_admin_pass'
}

addMysql { 'pp_admin_db':
    user => 'pp_admin_user',
    password => 'iPMk4Qmc'
}

addMysql { 'pp_app_db':
    user => 'pp_app_user',
    password => 'SXnkpXrF'
}
