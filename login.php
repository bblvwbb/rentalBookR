<!DOCTYPE html>
<html>
<meta charset="utf-8">
<title>ログイン</title>
<head>
<link rel="stylesheet" href="css/reset.min.css" />
<link rel="stylesheet" href="css/style.min.css" />
<script src="js/jquery-1.10.1.min.js"></script>
<script>
	$("document").ready(function(){
		$("input[type=text]").focus();
	});
</script>
</head>
<body id="login">
	<article id="contents" class="clear">
		<form method="post" action="php/memberController.php">
			<input type="hidden" name="request" value="login" />
			ユーザーID：<input type="text" name="memberId" />(半角英文字)<br>
			パスワード：<input type="password" name="memberPassword" />(半角英文字)<br>
			<input class="submit" type="submit" value="ログイン" />
		</form>
	</article>
</body>
</html>
