<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Illuminate\Foundation\Testing\WithFaker;
use Tests\TestCase;
use App\Models\producto;

class ProductoIntegrationTest extends TestCase
{
    use RefreshDatabase; 

    /**
     * Test para crear un producto y luego consultar su existencia.
     *
     * @return void
     */
    public function test_crear_y_consultar_producto()
    {
        // Crear un producto utilizando el factory
        $producto = producto::factory()->create([
            'nom_producto' => 'Producto de prueba',
            'precio_unitario' => 50.25,
            'unidades_disponibles' => 100,
            'marca' => 'Marca de prueba',
            'id_proveedor' => 1, 
            'id_categoria' => 1, 
        ]);

    
        $response = $this->getJson('/api/producto/' . $producto->id_producto);

    
        $response->assertStatus(200);

       
        $response->assertJsonStructure([
            'success',
            'message',
            'data' => [
                'id_producto',
                'nom_producto',
                'precio_unitario',
                'unidades_disponibles',
                'marca',
                'id_proveedor',
                'id_categoria',
            ]
        ]);

   
        $response->assertJson([
            'data' => [
                'id_producto' => $producto->id_producto,
                'nom_producto' => 'Producto de prueba',
                'precio_unitario' => 50.25,
                'unidades_disponibles' => 100,
                'marca' => 'Marca de prueba',
                'id_proveedor' => 1,
                'id_categoria' => 1,
            ]
        ]);
    }
}
