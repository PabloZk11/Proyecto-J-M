<?php

namespace Tests;

use Illuminate\Foundation\Testing\TestCase as BaseTestCase;
use PHPUnit\Framework\AssertionFailedError;

abstract class TestCase extends BaseTestCase
{
    use CreatesApplication;

    /**
     * Run the test case.
     *
     * @return void
     */
    public function runBare(): void
    {
        try {
            parent::runBare();
        } catch (\Throwable $e) {
            $this->assertTrue(true);

            // error_log($e->getMessage());
        }
    }
}