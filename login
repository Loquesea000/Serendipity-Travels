<!DOCTYPE html>
<html lang="es" xmlns:th="http://www.thymeleaf.org">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Inicio de Sesión</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css">
    <style>
        html, body {
            height: 100%;
            margin: 0;
            overflow: hidden;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background-color: #121212;
            color: white;
            display: flex;
            align-items: center;
            justify-content: center;
            position: relative;
        }

        .background-particles {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 1;
        }

        .login-container {
            background: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.3);
            overflow: hidden;
            width: 100%;
            max-width: 500px;
            backdrop-filter: blur(10px);
            border: 1px solid rgba(255, 255, 255, 0.125);
            position: relative;
            z-index: 10;
        }

        .login-header {
            background: linear-gradient(135deg, rgba(52, 152, 219, 0.7), rgba(41, 128, 185, 0.7));
            color: white;
            padding: 20px;
            text-align: center;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .logo {
            margin-bottom: 15px;
            display: flex;
            justify-content: center;
        }

        .logo img {
            height: 100px;
            max-width: 250px;
            object-fit: contain;
            transition: transform 0.3s ease;
        }

        .logo img:hover {
            transform: scale(1.05);
        }

        .login-header h1 {
            margin-bottom: 10px;
            font-size: 1.5rem;
        }

        .login-header p {
            margin: 0;
            font-size: 1rem;
            color: rgba(255,255,255,0.8);
        }

        .login-form {
            padding: 30px;
            position: relative;
        }

        .form-label {
            color: rgba(255, 255, 255, 0.8);
        }

        .form-control {
            background-color: rgba(255, 255, 255, 0.1);
            border: 1px solid rgba(255, 255, 255, 0.2);
            color: white;
        }

        .form-control:focus {
            background-color: rgba(255, 255, 255, 0.2);
            border-color: #3498db;
            color: white;
            box-shadow: 0 0 10px rgba(52, 152, 219, 0.3);
        }

        .btn-primary {
            background: linear-gradient(135deg, #3498db, #2980b9);
            border: none;
            border-radius: 20px;
            transition: all 0.3s ease;
        }

        .btn-primary:hover, .btn-secondary:hover {
            transform: translateY(-3px);
            box-shadow: 0 5px 15px rgba(52, 152, 219, 0.4);
        }

        .btn-secondary {
            background: linear-gradient(135deg, #95a5a6, #7f8c8d);
            border: none;
            border-radius: 20px;
            transition: all 0.3s ease;
        }

        .additional-links {
            margin-top: 20px;
            text-align: center;
        }

        .back-button {
            position: fixed;
            bottom: 30px;
            left: 30px;
        }

        .additional-links a {
            color: #3498db;
            text-decoration: none;
        }

        .additional-links a:hover {
            text-decoration: underline;
        }

        .text-danger {
            color: #e74c3c !important;
        }
    </style>
</head>
<body>
    <canvas class="background-particles"></canvas>
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-12 col-md-6">
                <div class="login-container">
                    <div class="login-header">
                        <div class="logo">
                            <img th:src="@{/IMAGENES/logo1.png}" src="IMAGENES/logo1.png" alt="Logo">
                        </div>
                        <h1>SerendipityTravels</h1>
                        <p>Explora. Sueña. Viaja.</p>
                    </div>
                    <div class="login-form">
                        <form th:action="@{/index}" th:object="${usuario}" method="post">
                            <div class="mb-3">
                                <label for="correo" class="form-label">
                                    <i class="fas fa-envelope"></i> Correo
                                </label>
                                <input type="email" class="form-control" id="correo" name="correo" 
                                       th:field="*{correo}" required 
                                       placeholder="Ingresa tu correo">
                            </div>
                            <div class="mb-3">
                                <label for="contra" class="form-label">
                                    <i class="fas fa-lock"></i> Contraseña
                                </label>
                                <input type="password" class="form-control" id="contra" name="contra" 
                                       th:field="*{contra}" required 
                                       placeholder="Ingresa tu contraseña">
                            </div>
                            <button type="submit" class="btn btn-primary w-100">
                                <i class="fas fa-sign-in-alt"></i> Ingresar
                            </button>

                            <!-- Error Message -->
                            <div class="text-danger text-center mt-3" th:if="${error}">
                                <p th:text="${error}"></p>
                            </div>

                            <div class="additional-links">
                                <p>¿No estás registrado? <a href="/usuarios/formularioregistro">Regístrate Aquí</a></p>
                                <p><a href="/admin/login">Iniciar como Administrador</a></p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <div class="back-button">
        <a href="/index" class="btn btn-primary">
            <i class="fas fa-arrow-left"></i> Volver
        </a>
    </div>

    <script>
        const canvas = document.querySelector('.background-particles');
        const ctx = canvas.getContext('2d');

        canvas.width = window.innerWidth;
        canvas.height = window.innerHeight;

        let particlesArray = [];
        const numberOfParticles = 200;

        class Particle {
            constructor() {
                this.x = Math.random() * canvas.width;
                this.y = Math.random() * canvas.height;
                this.size = Math.random() * 3 + 1;
                this.speedX = Math.random() * 3 - 1.5;
                this.speedY = Math.random() * 3 - 1.5;
                this.color = `rgba(52, 152, 219, ${Math.random() * 0.5})`;
            }

            update() {
                this.x += this.speedX;
                this.y += this.speedY;

                if (this.x < 0 || this.x > canvas.width) this.speedX *= -1;
                if (this.y < 0 || this.y > canvas.height) this.speedY *= -1;
            }

            draw() {
                ctx.fillStyle = this.color;
                ctx.beginPath();
                ctx.arc(this.x, this.y, this.size, 0, Math.PI * 2);
                ctx.fill();
            }
        }

        function init() {
            particlesArray = [];
            for (let i = 0; i < numberOfParticles; i++) {
                particlesArray.push(new Particle());
            }
        }

        function animate() {
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            for (let i = 0; i < particlesArray.length; i++) {
                particlesArray[i].update();
                particlesArray[i].draw();
            }
            requestAnimationFrame(animate);
        }

        window.addEventListener('resize', () => {
            canvas.width = window.innerWidth;
            canvas.height = window.innerHeight;
            init();
        });

        init();
        animate();
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
