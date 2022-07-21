<?php
class DefaultController
{

  private $_route;

  public function __construct($route = null)
  {
    if (isset($route)) {
      $this->_route = $route;
    }
  }


  public function getRoute()
  {
    return $this->_route;
  }

  public function setRoute($newRoute)
  {
    $this->_route = $newRoute;
  }

}
