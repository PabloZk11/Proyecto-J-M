<?php

namespace Tests\Feature;

use Illuminate\Foundation\Testing\RefreshDatabase;
use Tests\TestCase;
use App\Models\usuario;

class UsuarioIntegrationTest extends TestCase
{
    use RefreshDatabase;

    public function test_actualizar_usuario()
    {
        // Crear un usuario usando la fábrica
        $usuario = usuario::factory()->create([
            'nombre' => 'Andres',
            'apellido' => 'Pastrana',
            'email' => 'andres@example.com',
            'password' => bcrypt('andres5'),
            'id_rol' => 1,
            'id_documento' => 1,
        ]);

        // Datos de actualización
        $updatedData = [
            'nombre' => 'Andres Updated',
            'apellido' => 'Pastrana Updated',
            'email' => 'andres.updated@example.com',
            'id_rol' => 2,
            'id_documento' => 2,
        ];

        // Enviar una solicitud PUT a la ruta de actualización
        $response = $this->putJson('/api/usuario/' . $usuario->id_usuario, $updatedData);

        // Verificar que la respuesta sea exitosa
        $response->assertStatus(200);

        // Verificar que los datos en la base de datos se hayan actualizado
        $this->assertDatabaseHas('usuario', [
            'id_usuario' => $usuario->id_usuario,
            'nombre' => 'Andres Updated',
            'apellido' => 'Pastrana Updated',
            'email' => 'andres.updated@example.com',
            'id_rol' => 2,
            'id_documento' => 2,
        ]);
    }
}
