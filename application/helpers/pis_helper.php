<?php  if ( ! defined('BASEPATH')) exit('No direct script access allowed');

if (!function_exists('assets_url'))
{
    function assets_url( $type = null, $path = null )
    {
        $url = base_url() . "assets/" . $type . "/" . $path;
        return $url;
    }
}
if (!function_exists('vendor_url'))
{
    function vendor_url( $libraries = null )
    {
        $url = base_url() . "assets/vendor/" . $libraries;
        return $url;
    }
}
if (!function_exists('img_url'))
{
    function img_url( $libraries = null )
    {
        $url = base_url() . "assets/" . $libraries;
        return $url;
    }
}
if (!function_exists('img_product'))
{
    function img_product( $libraries = null )
    {
        $url = base_url() . "assets/img/content/" . $libraries;
        return $url;
    }
}

