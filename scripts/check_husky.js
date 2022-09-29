const { exec } = require('child_process')

exec('npx husky', (err, stdout) => {
	if (err || !stdout.startsWith('Usage')) {
		return console.log()
	}

	console.log('husky installed')
})
