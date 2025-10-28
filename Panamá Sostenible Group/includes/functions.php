<?php
function getCategorias($conn) {
    $sql = "SELECT * FROM categorias ORDER BY nombre";
    $stmt = $conn->prepare($sql);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}

function getServiciosDestacados($conn, $limit = 6) {
    $sql = "SELECT s.*, p.nombre_empresa, p.ubicacion, c.nombre as categoria 
            FROM servicios s 
            JOIN proveedores p ON s.proveedor_id = p.id 
            JOIN categorias c ON p.categoria_id = c.id 
            WHERE s.disponibilidad = 1 
            ORDER BY s.created_at DESC 
            LIMIT :limit";
    $stmt = $conn->prepare($sql);
    $stmt->bindValue(':limit', $limit, PDO::PARAM_INT);
    $stmt->execute();
    return $stmt->fetchAll(PDO::FETCH_ASSOC);
}
?>