<?php 

namespace Utils;
class TimeUtils {
    // Funções auxiliares (helpers)
    public static function formatarData($timestamp) {
        return date('d/m/Y H:i', $timestamp);
    }

    public static function calcularDiasRestantes($timestamp) {
        $agora = time();
        $diferenca = $timestamp - $agora;
        return ceil($diferenca / (24 * 60 * 60));
    }

    public static function isUrgente($dias) {
        return $dias <= 7;
    }

}