<?php

class ApiView
{

    public function response($data, $status)
    {
        header("Content-Type: application/json");
        header("HTTP/1.1 " . $status . " " . $this->requestStatus($status));        
        echo json_encode($data);
    }

    private function requestStatus($code)
    {
        $status = array(
            200 => "OK",
            404 => "Not found",
            500 => "Internal Server Error"
        );

        if (isset($status[$code]))
            return $status[$code];
        else
            return $status[500];
    }
}
