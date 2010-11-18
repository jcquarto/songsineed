$(function() {
	$("#songs th a, #songs .pagination a").live('click', function() {
		$.getScript(this.href);
		//alert(this.href);
		return false;
	});
	$("#songs_search input").keyup(function() {
		$.get(
			$("#songs_search").attr("action"),
			$("#songs_search").serialize(),
			null,
			"script"
		);
	});
});