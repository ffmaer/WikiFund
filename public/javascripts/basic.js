/*
 * SimpleModal Basic Modal Dialog
 * http://www.ericmmartin.com/projects/simplemodal/
 * http://code.google.com/p/simplemodal/
 *
 * Copyright (c) 2010 Eric Martin - http://ericmmartin.com
 *
 * Licensed under the MIT license:
 *   http://www.opensource.org/licenses/mit-license.php
 *
 * Revision: $Id: basic.js 254 2010-07-23 05:14:44Z emartin24 $
 */

jQuery(function ($) {
	// Load dialog on page load
	//$('#basic-modal-content').modal();

	// Load dialog on click
	$('#basic-modal .basic-1').click(function (e) {
		$('#basic-modal-content-1').modal();

		return false;
	});

    	$('#basic-modal .basic-2').click(function (e) {
		$('#basic-modal-content-2').modal();

		return false;
	});
});