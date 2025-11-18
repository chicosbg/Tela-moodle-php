        <footer>
            <p>Última atualização: <?php echo date('d/m/Y H:i:s'); ?></p>
            <p>
                <a href="javascript:location.reload()">🔄 Atualizar</a> | 
                <a href="configuracoes.php">⚙️ Configurações</a> | 
                <!-- <a href="../notification_engine.php" target="_blank">🔧 Motor de Notificações</a> -->
            </p>
        </footer>
    </div>

    <script>
        // Auto-atualiza a página a cada 2 minutos
        setTimeout(function() {
            location.reload();
        }, 120000);
    </script>
</body>
</html>
