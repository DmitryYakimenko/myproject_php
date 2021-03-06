<?php

class App{

    protected static $router;

    public static $db;

    /**
     * @return mixed
     */
    public static function getRouter(){
        return self::$router;
    }

    public static function run($uri){
        self::$router = new Router($uri);

        self::$db = new DB(Config::get('db.host'), Config::get('db.user'), Config::get('db.password'), Config::get('db.db_name'));

        Lang::load(self::$router->getLanguage());

        $controller_class = ucfirst(self::$router->getController()).'Controller';
        $controller_method = strtolower(self::$router->getMethodPrefix().self::$router->getAction());
        $controller_name = self::$router->getController();

        $layout = self::$router->getRoute();
        if ( $layout == 'admin' && Session::get('user')['role'] != 'admin' ){
            if ( $controller_method != 'admin_login' ){
                Router::redirect('/');
            }
        }

        // Calling controller's method
        $controller_object = new $controller_class();
        if ( method_exists($controller_object, $controller_method) ){
            // Controller's action may return a view path
            $view_path = $controller_object->$controller_method();

            $view_object = new View(null , VIEWS_PATH.DS."cart.html");
            $content['cart'] = $view_object->render();

            $view_object = new View($controller_object->getData()['menus'] , VIEWS_PATH.DS."menu.html");
            $content['menu'] = $view_object->render();


            $view_object = new View(null , VIEWS_PATH.DS."users/authorization.html");
            $content['authorization'] = $view_object->render();

            if( isset($controller_object->getData()['attribute']) ){
                $view_object = new View($controller_object->getData()['attribute'] , VIEWS_PATH.DS."select.html");
                $content['select'] = $view_object->render();
            }


            if( isset($controller_object->getData()["path"]) ){
                if( file_exists(VIEWS_PATH.DS."{$controller_object->getData()["path"]}") ){
                    $view_path = VIEWS_PATH.DS."{$controller_object->getData()["path"]}";
                }
            }


            $view_object = new View($controller_object->getData()["$controller_name"] , $view_path);
            $content['main_content'] = $view_object->render();
            //echo "<pre>";var_dump($controller_object->getData());die;

        } else {
            throw new Exception('Method '.$controller_method.' of class '.$controller_class.' does not exist.');
        }

        //default.html
        $layout_path = VIEWS_PATH.DS.$layout.'.html';
        $layout_view_object = new View(compact('content'), $layout_path);
        echo $layout_view_object->render();
    }

}