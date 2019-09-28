	<!DOCTYPE html>
	<html lang="en">

	<head>
	    <meta charset="UTF-8">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <title>Авторизация</title>
	    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
	</head>

	<body>
	    <style>
	        .bg-fpc {
				background: #bb1e10; 
			};
		</style>
	    <div class="container-fluid mt-5">
	        <div class="card w-50 m-auto">
	            <form action="auth.php" method="GET">
	                <div class="card-header">
	                    <h5>Вход</h5>
	                </div>
	                <div class="card-body">
	                    <div class="form-group">
	                        <label for="inputMail">E-mail:</label>
	                        <input name="email" type="email" id="inputMail" class="form-control" required="">
	                    </div>
	                    <div class="form-group">
	                        <label for="inputPass">Пароль:</label>
	                        <input name="password" type="password" id="inputPass" class="form-control" required="">
	                    </div>
	                </div>
	                <div class="card-footer">
	                    <button type="submit" class="btn bg-fpc text-white">Войти</button>
	                </div>
	            </form>
	        </div>
	    </div>
	</body>

	</html>
