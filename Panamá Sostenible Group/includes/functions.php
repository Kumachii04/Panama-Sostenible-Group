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

function getServiciosFiltrados($conn, $filtros = []) {
    $sql = "SELECT s.*, p.nombre_empresa, p.ubicacion, p.sostenible, c.nombre as categoria 
            FROM servicios s 
            JOIN proveedores p ON s.proveedor_id = p.id 
            JOIN categorias c ON p.categoria_id = c.id 
            WHERE s.disponibilidad = 1";
    
    $params = [];
    
    if (!empty($filtros['search'])) {
        $sql .= " AND (s.titulo LIKE :search OR s.descripcion LIKE :search OR p.nombre_empresa LIKE :search)";
        $params[':search'] = '%' . $filtros['search'] . '%';
    }
    
    if (!empty($filtros['categoria_id'])) {
        $sql .= " AND p.categoria_id = :categoria_id";
        $params[':categoria_id'] = $filtros['categoria_id'];
    }
    
    if (!empty($filtros['precio_min'])) {
        $sql .= " AND s.precio >= :precio_min";
        $params[':precio_min'] = $filtros['precio_min'];
    }
    
    if (!empty($filtros['precio_max'])) {
        $sql .= " AND s.precio <= :precio_max";
        $params[':precio_max'] = $filtros['precio_max'];
    }
    
    if (!empty($filtros['ubicacion'])) {
        $sql .= " AND p.ubicacion LIKE :ubicacion";
        $params[':ubicacion'] = '%' . $filtros['ubicacion'] . '%';
    }
    
    if (!empty($filtros['sostenible'])) {
        $sql .= " AND p.sostenible = 1";
    }
    
    $sql .= " ORDER BY s.rating_promedio DESC, s.created_at DESC";
    
    $stmt = $conn->prepare($sql);
    $stmt->execute($params);
    return $stmt->fetchAll();
}

function getServicioById($conn, $servicio_id) {
    $sql = "SELECT s.*, p.nombre_empresa, p.telefono, p.email, p.ubicacion, p.lat, p.lng, 
                   p.sostenible, p.descripcion as descripcion_proveedor, c.nombre as categoria,
                   c.id as categoria_id
            FROM servicios s 
            JOIN proveedores p ON s.proveedor_id = p.id 
            JOIN categorias c ON p.categoria_id = c.id 
            WHERE s.id = :id";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':id', $servicio_id);
    $stmt->execute();
    return $stmt->fetch();
}
?>
