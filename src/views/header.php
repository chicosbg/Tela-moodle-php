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
            <h1>📚 Painel Moodle</h1>
            <p class="subtitle">Visão geral das suas atividades e notificações</p>
            <?php if (isset($error)): ?>
                <div style="background: #f8d7da; color: #721c24; padding: 10px; border-radius: 5px; margin-top: 10px;">
                    <?php echo htmlspecialchars($error); ?>
                </div>
            <?php endif; ?>
        </header>
