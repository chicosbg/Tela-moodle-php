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
    
    public static function formatarTempoRelativo($timestamp) {
        $agora = time();
        $diferenca = $agora - $timestamp;
        
        if ($diferenca < 60) {
            return 'agora há pouco';
        } elseif ($diferenca < 3600) {
            $minutos = floor($diferenca / 60);
            return "há {$minutos} minuto" . ($minutos > 1 ? 's' : '');
        } elseif ($diferenca < 86400) {
            $horas = floor($diferenca / 3600);
            return "há {$horas} hora" . ($horas > 1 ? 's' : '');
        } elseif ($diferenca < 604800) {
            $dias = floor($diferenca / 86400);
            return "há {$dias} dia" . ($dias > 1 ? 's' : '');
        } else {
            return date('d/m/Y H:i', $timestamp);
        }
    }
}
