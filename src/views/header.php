<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Painel Moodle - Dashboard</title>
    <link rel="stylesheet" href="../css/style.css">
</head>
<body>

    <div class="container">

        <header>
            <div style="display: flex; align-items: center; gap: 10px; justify-content: center">
                <img src="moodle-icon.png" width="4%" style="margin-top: 0px;"/>
                <h1 style="margin: 0;">Painel Moodle</h1>
            </div>
            <p class="subtitle">Visão geral das suas atividades e notificações</p>
            <?php if (isset($error)): ?>
                <div style="background: #f8d7da; color: #721c24; padding: 10px; border-radius: 5px; margin-top: 10px;">
                    <?php echo htmlspecialchars($error); ?>
                </div>
            <?php endif; ?>
        </header>
