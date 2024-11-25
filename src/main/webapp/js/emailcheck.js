const mailsender = (function() {

	

console.log("asdasd");
/*	function rndText(mailsender, callback) {
		console.log(mailsender);
		const data = JSON.stringify(mailsender);
		$.post({ url, data })
			.done(function(data) {
				console.log(data);
				if (callback)
					callback(data);

			});
	}*/
	function rndText(mailsender) {
		console.log(mailsender);
		const data = JSON.stringify(mailsender);
		$.post({ url, data })
			.done(function(data) {
				console.log(data);
			

			});
	}
	return { rndText }
});