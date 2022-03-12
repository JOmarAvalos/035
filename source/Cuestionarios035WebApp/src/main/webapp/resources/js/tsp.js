function tspInit(window, storage, prefix, callback){
	
	prefix = typeof prefix !== 'undefined' ? prefix : '';
	callback = typeof callback !== 'undefined' ? callback : console.log;
	
	window.API = {};
	
	window.scormStatus = {
			lesson_status: '',
			score_raw: 0,
			score_max: 100,
			score_min: 0,
			session_time: 0,
			detailed_answers: {}
	};
	
	
	window.API.LMSInitialize = function(){
		//console.log('LMSInitialize');
	}
	window.API.LMSTerminate = function() {
		//console.log('LMSTerminate');
	}
	
	window.API.LMSGetValue = function(varname) {
		varname = prefix + varname;
		var ret = storage.getItem(varname);
		if (ret == null && (varname.indexOf('_count', this.length - '_count'.length) !== -1)) {
			ret = 0;
			storage.setItem(varname, ret);
		}
		//console.log('LMSGetValue', varname, '=', ret);
		return ret;
	}
	
	window.API.LMSSetValue = function(varname, varvalue) {
		varname = prefix + varname;
	
		var m = varname.match(/([0-9]+)\.cmi\.interactions\.([0-9]+)\.id/);
		if (m != null) {
			storage.setItem('{{scorm.id}}.cmi.interactions._count', parseInt(m[2]) + 1);
		}
	
		m = varname.match(/([0-9]+)\.cmi\.interactions\.([0-9]+)\.result/);
		if (m != null) {
			var key = storage.getItem(prefix + 'cmi.interactions.' + parseInt(m[2]) + '.id');
			window.scormStatus.detailed_answers[key] = varvalue;
		}
	
		if (varname == prefix + 'cmi.core.lesson_status')
			window.scormStatus.lesson_status = varvalue;
		if (varname == prefix + 'cmi.core.score.raw')
			window.scormStatus.score_raw = varvalue;
		if (varname == prefix + 'cmi.core.score.max')
			window.scormStatus.score_max = varvalue;
		if (varname == prefix + 'cmi.core.score.min')
			window.scormStatus.score_min = varvalue;
		if (varname == prefix + 'cmi.core.session_time')
			window.scormStatus.session_time = varvalue;
	
		storage.setItem(varname, varvalue); 
		//console.log('LMSSetValue', varname, '=', varvalue);
	}
	
	window.API.LMSCommit = function() {
		//console.log('LMSCommit');
		//saving to API
		callback(window.scormStatus);
		return true; 
	
	}
	
	window.API.LMSFinish = function() {
		//console.log('LMSFinish');
	}
	
	window.API.LMSGetLastError = function() {
		//console.log('LMSGetLastError');
	}
	
	window.API.LMSGetErrorString = function() {
		//console.log('LMSGetErrorString');
	}
	
	window.API.LMSGetDiagnostic = function() {
		//console.log('LMSGetDiagnostic');
	}
	
}