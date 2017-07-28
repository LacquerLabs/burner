<?php

	function startsWith($haystack, $needle) {
		$length = strlen($needle);
		return (substr($haystack, 0, $length) === $needle);
	}

	function endsWith($haystack, $needle) {
		$length = strlen($needle);
		if ($length == 0)  return true;
		else return (substr($haystack, -$length) === $needle);
	}


	$dir = './data/';
	$files = scandir($dir);
	$point_data = [];
	foreach($files as $filename) {
		if(startsWith($filename, 'history') && endsWith($filename, 'json')) {
			$flight_data = json_decode(file_get_contents($dir.$filename), true);
			foreach($flight_data['aircraft'] as $values) {
				if(isset($values['lat']) && isset($values['lon'])) {
					$point_data[] = array(	'lat' => $values['lat'] ,
											'lng' => $values['lon']);

				}
			}
		}
	}

	print_r(json_encode($point_data));