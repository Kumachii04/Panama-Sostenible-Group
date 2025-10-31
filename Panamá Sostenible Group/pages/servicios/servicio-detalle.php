<?php
$pageTitle = "Detalle del Servicio";

// Incluir archivos con rutas correctas
include '../../includes/header.php';
include '../../config/database.php';
include '../../includes/functions.php';
include '../../includes/auth.php';

$database = new Database();
$conn = $database->getConnection();

$servicio_id = $_GET['id'] ?? 0;

if (!$servicio_id) {
    header('Location: servicios.php');
    exit;
}

$servicio = getServicioById($conn, $servicio_id);

if (!$servicio) {
    echo "<div class='container'><p>Servicio no encontrado</p></div>";
    include '../../includes/footer.php';
    exit;
}

// Obtener reseñas
$stmt = $conn->prepare("
    SELECT r.*, u.nombre as usuario_nombre 
    FROM resenas r 
    JOIN usuarios u ON r.usuario_id = u.id 
    WHERE r.servicio_id = :servicio_id 
    ORDER BY r.created_at DESC 
    LIMIT 5
");
$stmt->bindParam(':servicio_id', $servicio_id);
$stmt->execute();
$resenas = $stmt->fetchAll();

// Verificar favorito
$enFavoritos = false;
if (isLoggedIn()) {
    $stmt = $conn->prepare("
        SELECT id FROM favoritos 
        WHERE usuario_id = :usuario_id AND servicio_id = :servicio_id
    ");
    $stmt->bindParam(':usuario_id', $_SESSION['user_id']);
    $stmt->bindParam(':servicio_id', $servicio_id);
    $stmt->execute();
    $enFavoritos = $stmt->fetch() !== false;
}
?>

<div class="service-detail">
    <!-- Breadcrumb -->
    <div class="container">
        <nav class="breadcrumb">
            <a href="../../index.php">Inicio</a>
            <span>></span>
            <a href="servicios.php">Servicios</a>
            <?php if(isset($servicio['categoria_id'])): ?>
            <span>></span>
            <a href="servicios.php?categoria=<?= $servicio['categoria_id'] ?>">
                <?= htmlspecialchars($servicio['categoria']) ?>
            </a>
            <?php endif; ?>
            <span>></span>
            <span><?= htmlspecialchars($servicio['titulo']) ?></span>
        </nav>
    </div>

    <div class="container">
        <div class="service-detail-layout">
            <!-- Contenido Principal -->
            <main class="service-main">
                <!-- Galería -->
                <section class="service-gallery">
                    <?php
                    $imagenes = json_decode($servicio['imagenes'] ?? '[]');
                    $imagenPrincipal = $imagenes[0] ?? '../../assets/images/placeholder-service.jpg';
                    ?>
                    <div class="main-image">
                        <img src="<?= $imagenPrincipal ?>" alt="<?= htmlspecialchars($servicio['titulo']) ?>"
                            id="mainImage">
                    </div>
                    <?php if(count($imagenes) > 1): ?>
                    <div class="image-thumbnails">
                        <?php foreach($imagenes as $index => $imagen): ?>
                        <div class="thumbnail <?= $index === 0 ? 'active' : '' ?>"
                            onclick="cambiarImagen('<?= $imagen ?>', this)">
                            <img src="<?= $imagen ?>" alt="Thumbnail <?= $index + 1 ?>">
                        </div>
                        <?php endforeach; ?>
                    </div>
                    <?php endif; ?>
                </section>

                <!-- Información del Servicio -->
                <section class="service-info-detailed">
                    <div class="service-header">
                        <h1><?= htmlspecialchars($servicio['titulo']) ?></h1>
                        <div class="service-actions">
                            <button class="btn-favorite <?= $enFavoritos ? 'active' : '' ?>"
                                onclick="toggleFavorite(<?= $servicio_id ?>)">
                                <?= $enFavoritos ? '♥' : '♡' ?> Favorito
                            </button>
                            <button class="btn btn-primary" onclick="scrollToReservation()">
                                📅 Reservar
                            </button>
                        </div>
                    </div>

                    <div class="service-meta-detailed">
                        <div class="provider-info">
                            <strong>Proveedor:</strong> <?= htmlspecialchars($servicio['nombre_empresa']) ?>
                            <?php if($servicio['sostenible']): ?>
                            <span class="badge sustainable">♻️ Sostenible</span>
                            <?php endif; ?>
                        </div>
                        <div class="location-info">
                            📍 <?= htmlspecialchars($servicio['ubicacion']) ?>
                        </div>
                        <div class="rating-info">
                            ⭐
                            <?= $servicio['rating_promedio'] ? number_format($servicio['rating_promedio'], 1) : 'Nuevo' ?>
                            <?php if($servicio['total_resenas'] > 0): ?>
                            <span>(<?= $servicio['total_resenas'] ?> reseñas)</span>
                            <?php endif; ?>
                        </div>
                    </div>

                    <!-- Descripción -->
                    <div class="service-description-detailed">
                        <h3>Descripción</h3>
                        <p><?= nl2br(htmlspecialchars($servicio['descripcion'])) ?></p>
                    </div>

                    <!-- Características -->
                    <?php
                    $caracteristicas = json_decode($servicio['caracteristicas'] ?? '[]', true);
                    if ($caracteristicas && count($caracteristicas) > 0):
                    ?>
                    <div class="service-features">
                        <h3>Características</h3>
                        <div class="features-list">
                            <?php foreach($caracteristicas as $caracteristica): ?>
                            <div class="feature-item">✅ <?= htmlspecialchars($caracteristica) ?></div>
                            <?php endforeach; ?>
                        </div>
                    </div>
                    <?php endif; ?>

                    <!-- Reseñas -->
                    <div class="service-reviews">
                        <h3>Reseñas</h3>
                        <?php if(empty($resenas)): ?>
                        <p class="no-reviews">Este servicio aún no tiene reseñas.</p>
                        <?php else: ?>
                        <div class="reviews-list">
                            <?php foreach($resenas as $resena): ?>
                            <div class="review-item">
                                <div class="review-header">
                                    <strong><?= htmlspecialchars($resena['usuario_nombre']) ?></strong>
                                    <div class="review-rating">
                                        <?php for($i = 1; $i <= 5; $i++): ?>
                                        <?= $i <= $resena['rating'] ? '⭐' : '☆' ?>
                                        <?php endfor; ?>
                                    </div>
                                </div>
                                <p class="review-comment"><?= nl2br(htmlspecialchars($resena['comentario'])) ?></p>
                                <small class="review-date">
                                    <?= date('d/m/Y', strtotime($resena['created_at'])) ?>
                                </small>
                            </div>
                            <?php endforeach; ?>
                        </div>
                        <?php endif; ?>
                    </div>
                </section>
            </main>

            <!-- Sidebar de Reserva -->
            <aside class="reservation-sidebar">
                <div class="reservation-widget">
                    <div class="price-widget">
                        <span class="price">$<?= number_format($servicio['precio'], 2) ?></span>
                        <span class="unit">/<?= $servicio['tipo_precio'] ?></span>
                    </div>

                    <form id="reservationForm" class="reservation-form">
                        <input type="hidden" name="servicio_id" value="<?= $servicio_id ?>">

                        <div class="form-group">
                            <label>Fecha de inicio</label>
                            <input type="datetime-local" name="fecha_inicio" id="fechaInicio" required
                                class="form-control">
                        </div>

                        <div class="form-group">
                            <label>Fecha de fin</label>
                            <input type="datetime-local" name="fecha_fin" id="fechaFin" required class="form-control">
                        </div>

                        <div class="form-group">
                            <label>Personas</label>
                            <input type="number" name="personas" id="personas" min="1" value="1" class="form-control">
                        </div>

                        <div class="form-group">
                            <label>Notas (opcional)</label>
                            <textarea name="notas" class="form-control" placeholder="Comentarios adicionales..."
                                rows="3"></textarea>
                        </div>

                        <div class="reservation-summary">
                            <div class="summary-item">
                                <span>Subtotal:</span>
                                <span id="subtotal">$0.00</span>
                            </div>
                            <div class="summary-item">
                                <span>Comisión:</span>
                                <span id="comision">$0.00</span>
                            </div>
                            <div class="summary-total">
                                <span>Total:</span>
                                <span id="totalReserva">$0.00</span>
                            </div>
                        </div>

                        <?php if(isLoggedIn()): ?>
                        <button type="submit" class="btn btn-primary btn-block">
                            Confirmar Reserva
                        </button>
                        <?php else: ?>
                        <a href="../../pages/login.php?redirect=<?= urlencode($_SERVER['REQUEST_URI']) ?>"
                            class="btn btn-primary btn-block">
                            Iniciar Sesión para Reservar
                        </a>
                        <?php endif; ?>
                    </form>
                </div>

                <!-- Información del Proveedor -->
                <div class="provider-widget">
                    <h4>Proveedor</h4>
                    <div class="provider-card">
                        <h5><?= htmlspecialchars($servicio['nombre_empresa']) ?></h5>
                        <p><strong>Email:</strong> <?= htmlspecialchars($servicio['email']) ?></p>
                        <p><strong>Teléfono:</strong> <?= htmlspecialchars($servicio['telefono']) ?></p>
                        <p><strong>Ubicación:</strong> <?= htmlspecialchars($servicio['ubicacion']) ?></p>
                        <p><strong>Descripción:</strong>
                            <?= htmlspecialchars($servicio['descripcion_proveedor'] ?? '') ?></p>
                    </div>
                </div>
            </aside>
        </div>
    </div>
</div>

<?php include '../../includes/footer.php'; ?>

<script>
// Variables
const precio = <?= $servicio['precio'] ?>;
const tipoPrecio = '<?= $servicio['tipo_precio'] ?>';

// Cambiar imagen principal
function cambiarImagen(src, elemento) {
    document.getElementById('mainImage').src = src;
    document.querySelectorAll('.thumbnail').forEach(thumb => {
        thumb.classList.remove('active');
    });
    elemento.classList.add('active');
}

// Toggle favorito
async function toggleFavorite(serviceId) {
    <?php if(!isLoggedIn()): ?>
    window.location.href = '../../pages/login.php?redirect=' + encodeURIComponent(window.location.href);
    return;
    <?php endif; ?>

    try {
        const response = await fetch('../../includes/favoritos.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({
                servicio_id: serviceId,
                action: 'toggle',
                csrf_token: '<?= $_SESSION['csrf_token'] ?>'
            })
        });

        const data = await response.json();

        if (data.success) {
            const btn = document.querySelector('.btn-favorite');
            if (data.favorito) {
                btn.innerHTML = '♥ Favorito';
                btn.classList.add('active');
                showNotification('Agregado a favoritos', 'success');
            } else {
                btn.innerHTML = '♡ Favorito';
                btn.classList.remove('active');
                showNotification('Removido de favoritos', 'info');
            }
        }
    } catch (error) {
        console.error('Error:', error);
        showNotification('Error al procesar la solicitud', 'error');
    }
}

// Calcular total
function calcularTotal() {
    const inicio = new Date(document.getElementById('fechaInicio').value);
    const fin = new Date(document.getElementById('fechaFin').value);
    const personas = parseInt(document.getElementById('personas').value) || 1;

    if (inicio && fin && inicio < fin) {
        const diffTiempo = fin - inicio;
        let subtotal = 0;

        switch (tipoPrecio) {
            case 'hora':
                const horas = Math.ceil(diffTiempo / (1000 * 60 * 60));
                subtotal = precio * horas * personas;
                break;
            case 'dia':
                const dias = Math.ceil(diffTiempo / (1000 * 60 * 60 * 24));
                subtotal = precio * dias * personas;
                break;
            case 'persona':
                subtotal = precio * personas;
                break;
            case 'fijo':
                subtotal = precio;
                break;
        }

        const comision = subtotal * 0.10;
        const total = subtotal + comision;

        document.getElementById('subtotal').textContent = `$${subtotal.toFixed(2)}`;
        document.getElementById('comision').textContent = `$${comision.toFixed(2)}`;
        document.getElementById('totalReserva').textContent = `$${total.toFixed(2)}`;
    }
}

// Scroll to reservation
function scrollToReservation() {
    document.querySelector('.reservation-sidebar').scrollIntoView({
        behavior: 'smooth'
    });
}

// Event Listeners
document.getElementById('fechaInicio').addEventListener('change', calcularTotal);
document.getElementById('fechaFin').addEventListener('change', calcularTotal);
document.getElementById('personas').addEventListener('input', calcularTotal);

// Form submission
document.getElementById('reservationForm').addEventListener('submit', async function(e) {
    e.preventDefault();

    const formData = {
        servicio_id: <?= $servicio_id ?>,
        fecha_inicio: document.getElementById('fechaInicio').value,
        fecha_fin: document.getElementById('fechaFin').value,
        personas: document.getElementById('personas').value,
        notas: document.querySelector('textarea[name="notas"]').value,
        total: document.getElementById('totalReserva').textContent.replace('$', ''),
        csrf_token: '<?= $_SESSION['csrf_token'] ?>'
    };

    try {
        const response = await fetch('../../includes/create_reservation.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify(formData)
        });

        const data = await response.json();

        if (data.success) {
            showNotification('¡Reserva creada exitosamente!', 'success');
            setTimeout(() => {
                window.location.href = '../reservas/mis-reservas.php';
            }, 1500);
        } else {
            showNotification('Error: ' + data.message, 'error');
        }
    } catch (error) {
        console.error('Error:', error);
        showNotification('Error al crear la reserva', 'error');
    }
});

// Initialize date inputs
document.addEventListener('DOMContentLoaded', function() {
    const ahora = new Date();
    const manana = new Date(ahora);
    manana.setDate(ahora.getDate() + 1);

    document.getElementById('fechaInicio').min = ahora.toISOString().slice(0, 16);
    document.getElementById('fechaFin').min = manana.toISOString().slice(0, 16);
});

function showNotification(message, type = 'info') {
    const notification = document.createElement('div');
    notification.className = `notification notification-${type}`;
    notification.innerHTML = `
        <span>${message}</span>
        <button onclick="this.parentElement.remove()">×</button>
    `;

    document.body.appendChild(notification);

    setTimeout(() => {
        if (notification.parentElement) {
            notification.remove();
        }
    }, 5000);
}
</script>

<style>
/* Estilos para servicio-detalle.php */
.service-detail-layout {
    display: grid;
    grid-template-columns: 1fr 400px;
    gap: 3rem;
    margin: 2rem 0;
}

.service-gallery {
    margin-bottom: 2rem;
}

.main-image {
    border-radius: 10px;
    overflow: hidden;
    margin-bottom: 1rem;
}

.main-image img {
    width: 100%;
    height: 400px;
    object-fit: cover;
}

.image-thumbnails {
    display: flex;
    gap: 0.5rem;
    overflow-x: auto;
}

.thumbnail {
    width: 80px;
    height: 80px;
    border-radius: 5px;
    overflow: hidden;
    cursor: pointer;
    opacity: 0.7;
    transition: opacity 0.3s ease;
    border: 2px solid transparent;
}

.thumbnail.active,
.thumbnail:hover {
    opacity: 1;
    border-color: #3498db;
}

.thumbnail img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.service-header {
    display: flex;
    justify-content: space-between;
    align-items: flex-start;
    margin-bottom: 1.5rem;
}

.service-header h1 {
    margin: 0;
    color: #2c3e50;
    flex: 1;
}

.service-actions {
    display: flex;
    gap: 1rem;
}

.btn-favorite {
    background: #ecf0f1;
    border: 2px solid #bdc3c7;
    padding: 0.5rem 1rem;
    border-radius: 5px;
    cursor: pointer;
    transition: all 0.3s ease;
}

.btn-favorite.active {
    background: #ff6b6b;
    border-color: #ff6b6b;
    color: white;
}

.service-meta-detailed {
    background: #f8f9fa;
    padding: 1.5rem;
    border-radius: 10px;
    margin-bottom: 2rem;
}

.service-meta-detailed>div {
    margin-bottom: 0.5rem;
}

.service-description-detailed,
.service-features,
.service-reviews {
    margin-bottom: 2rem;
}

.features-list {
    display: grid;
    gap: 0.5rem;
}

.review-item {
    background: white;
    padding: 1.5rem;
    border-radius: 10px;
    margin-bottom: 1rem;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.review-header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-bottom: 0.5rem;
}

.reservation-sidebar {
    position: sticky;
    top: 100px;
}

.reservation-widget {
    background: white;
    padding: 2rem;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    margin-bottom: 2rem;
}

.price-widget {
    text-align: center;
    margin-bottom: 2rem;
}

.price-widget .price {
    font-size: 2rem;
    font-weight: bold;
    color: #2ecc71;
}

.reservation-summary {
    background: #f8f9fa;
    padding: 1rem;
    border-radius: 5px;
    margin: 1.5rem 0;
}

.summary-item {
    display: flex;
    justify-content: space-between;
    margin-bottom: 0.5rem;
}

.summary-total {
    display: flex;
    justify-content: space-between;
    font-weight: bold;
    font-size: 1.1rem;
    border-top: 1px solid #ddd;
    padding-top: 0.5rem;
    margin-top: 0.5rem;
}

.provider-widget {
    background: white;
    padding: 1.5rem;
    border-radius: 10px;
    box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
}

.badge.sustainable {
    background: #27ae60;
    color: white;
    padding: 0.3rem 0.8rem;
    border-radius: 15px;
    font-size: 0.8rem;
}

@media (max-width: 968px) {
    .service-detail-layout {
        grid-template-columns: 1fr;
    }

    .service-header {
        flex-direction: column;
        gap: 1rem;
    }

    .service-actions {
        width: 100%;
        justify-content: center;
    }
}
</style>