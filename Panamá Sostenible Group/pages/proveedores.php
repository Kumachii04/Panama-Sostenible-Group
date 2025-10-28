<?php
$pageTitle = "Proveedores Sostenibles";
include '../includes/header.php';
include '../includes/database.php';

$database = new Database();
$conn = $database->getConnection();

// Obtener proveedores
$stmt = $conn->prepare("
    SELECT p.*, c.nombre as categoria_nombre, 
           COUNT(s.id) as total_servicios,
           AVG(s.precio) as precio_promedio
    FROM proveedores p
    LEFT JOIN categorias c ON p.categoria_id = c.id
    LEFT JOIN servicios s ON p.id = s.proveedor_id
    WHERE p.verificado = 1
    GROUP BY p.id
    ORDER BY p.created_at DESC
");
$stmt->execute();
$proveedores = $stmt->fetchAll(PDO::FETCH_ASSOC);
?>

<div class="page-header">
    <div class="container">
        <h1>Proveedores Sostenibles</h1>
        <p>Conoce a nuestros socios comprometidos con el turismo responsable</p>
    </div>
</div>

<div class="container">
    <div class="providers-grid">
        <?php foreach($proveedores as $proveedor): ?>
        <div class="provider-card">
            <div class="provider-header">
                <div class="provider-avatar">
                    <?= substr($proveedor['nombre_empresa'], 0, 2) ?>
                </div>
                <div class="provider-info">
                    <h3><?= $proveedor['nombre_empresa'] ?></h3>
                    <span class="category"><?= $proveedor['categoria_nombre'] ?></span>
                    <?php if($proveedor['sostenible']): ?>
                    <span class="badge-verified">♻️ Verificado Sostenible</span>
                    <?php endif; ?>
                </div>
            </div>

            <div class="provider-stats">
                <div class="stat">
                    <strong><?= $proveedor['total_servicios'] ?></strong>
                    <span>Servicios</span>
                </div>
                <div class="stat">
                    <strong>$<?= number_format($proveedor['precio_promedio'] ?? 0, 2) ?></strong>
                    <span>Precio promedio</span>
                </div>
            </div>

            <p class="provider-description">
                <?= substr($proveedor['descripcion'], 0, 150) ?>...
            </p>

            <div class="provider-contact">
                <p>📧 <?= $proveedor['email'] ?></p>
                <p>📞 <?= $proveedor['telefono'] ?></p>
                <p>📍 <?= $proveedor['ubicacion'] ?></p>
            </div>

            <div class="provider-actions">
                <a href="proveedor-detalle.php?id=<?= $proveedor['id'] ?>" class="btn btn-primary">Ver Perfil</a>
                <a href="servicios.php?proveedor=<?= $proveedor['id'] ?>" class="btn btn-outline">Ver Servicios</a>
            </div>
        </div>
        <?php endforeach; ?>
    </div>
</div>

<?php include '../includes/footer.php'; ?>