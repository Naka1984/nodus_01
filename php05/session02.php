<?php

session_start();

$name = $_SESSION['test'];

echo $name;