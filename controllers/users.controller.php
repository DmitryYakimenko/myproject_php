<?php

class UsersController extends Controller{

    public function __construct($data = array()){
        parent::__construct($data);
        $this->model = new User();
    }

    public function admin_login(){
        if ( $_POST && isset($_POST['login']) && isset($_POST['password']) ){
            $user = $this->model->getByLogin($_POST['login']);
            $hash = md5(Config::get('salt').$_POST['password']);
            if ( $user && $user['is_active'] && $hash == $user['password'] ){
                Session::set('login', $user['login']);
                Session::set('role', $user['role']);
            }
            Router::redirect('/admin/');
        }
    }

    public function admin_logout(){
        Session::destroy();
        Router::redirect('/admin/');
    }




    public function logout(){
        Session::destroy();
        Router::redirectRoot();
    }

    private function validateEmail($email){
        if( filter_var($email, FILTER_VALIDATE_EMAIL) ) {
            return true;
        }else{
            return false;
        }
    }

    private function validatePhone($phone){
        if( $phone[0] === '+' && $phone[1] === '3' ) {
            $count = 0;
            $number = array('0','1','2','3','4','5','6','7','8','9');
            for($i=2;$i<=13;$i++){
                for($j=0;$j<=9;$j++){
                    if( $phone[$i] == $number[$j] ){
                        $count++;
                    }
                }
            }
            if( $count == 11 ){
                return true;
            }
            return false;
        }else {
            return false;
        }
    }

    private function equalPassword($password , $rPassword){
        if($password === $rPassword ) {
            return true;
        }else{
            return false;
        }

    }

    private function check($field, $value){
        if($this->model->get($field, $value)){
            return true;
        }else{
            return false;
        }
    }

    private function notNull($array){
        $flag = true;
        foreach($array as $v){
            if( empty($v) ){
                $flag = false;
            }
        }
        return $flag;
    }

    public function log_out()
    {
        Session::destroy();
        Router::redirect('/pages/index');
    }

    public function authorization(){
        if($_POST && isset($_POST['email'])){
            $email = $_POST['email'];
            $password = md5(Config::get('salt').$_POST['password']);

            $user = $this->model->get('email', $email);

            if( $user['email'] === $email && $user['password'] === $password ) {
                /*if( $_POST['remember'] === 'on' ){
                    Cookie::set('username', $user['username']);
                    Cookie::set('surname', $user['surname']);
                    Cookie::set('email', $user['email']);
                    Cookie::set('phone', $user['phone']);
                    Cookie::set('role', $user['role']);
                    Cookie::set('id', $user['id']);
                }
                else {*/
                    Session::set('user', $user);
                //}
            }
        }
        Router::redirect('/');
    }

    public function view(){

    }
    public function edit(){

        switch ( App::getRouter()->getParams()[0] ){
            case 'email': $this->data['name'] = "e-mail";break;
            case 'password': $this->data['name'] = "пароль";$this->data['flag'] = true;break;
            case 'phone': $this->data['name'] = "номер телефона";break;
        }

        if( $_POST && isset($_POST['edit_btn']) ){
            $hash = md5(Config::get('salt').$_POST['old-password']);
            if( App::getRouter()->getParams()[0] === 'email' ) {
                if (Session::get('user')['password'] === $hash) {
                    $user = Session::get('user');
                    if ($this->check('email', $_POST['email'])) {
                        Session::setFlash("Пользователь с такой почтой ( " . $_POST['email'] . ") уже существует!</br>");
                        Router::redirect('');
                    } else {
                        if (!$this->validateEmail($_POST['email'])) {
                            Session::setFlash("Почта должна быть в таком формате user@mail.com</br>");
                            Router::redirect('');
                        }
                    }
                    if( !Session::hasFlash() ){
                        $user['email'] = $_POST['email'];
                        if( $this->model->save($user, Session::get('user')['id']) ){
                            Session::set('user', $user);
                            Router::redirect('');
                            Session::setFlash('OK');
                        }
                    }
                }else{
                    Session::setFlash("Неверный пароль");
                    Router::redirect('');
                }
            }

            if( App::getRouter()->getParams()[0] === 'phone' ) {
                if (Session::get('user')['password'] === $hash) {
                    $user = Session::get('user');
                    if ($this->check('phone', $_POST['phone'])) {
                        Session::setFlash("Пользователь с таким номером телефона ( " . $_POST['phone'] . ") уже существует!</br>");
                        Router::redirect('');
                    } else {
                        if (!$this->validatePhone($_POST['phone'])) {
                            Session::setFlash("Номер телефон должен быть в таком формате +300000000000");
                            Router::redirect('');
                        }
                    }
                    if( !Session::hasFlash() ){
                        $user['phone'] = $_POST['phone'];
                        if( $this->model->save($user, Session::get('user')['id']) ){
                            Session::set('user', $user);
                            Router::redirect('');
                            Session::setFlash('OK');
                        }
                    }
                }else{
                    Session::setFlash("Неверный пароль");
                    Router::redirect('');
                }
            }

            if( App::getRouter()->getParams()[0] === 'password' ) {
                if (Session::get('user')['password'] === $hash) {
                    $user = Session::get('user');
                    if( !$this->notNull($_POST) ) {
                        Session::setFlash("Должны быть заполнены все поля</br>");
                        Router::redirect('');
                    }
                    if ( !$this->equalPassword($_POST['password'], $_POST['r-password']) ) {
                        Session::setFlash("Пароли не совпадают!</br>");
                        Router::redirect('');
                    }
                    if( !Session::hasFlash() ){
                        $password = md5(Config::get('salt').$_POST['password']);
                        $user['password'] = $password;
                        if( $this->model->save($user, Session::get('user')['id']) ){
                            Session::set('user', $user);
                            Router::redirect('');
                            Session::setFlash('OK');
                        }
                    }
                }else{
                    Session::setFlash("Неверный пароль");
                    Router::redirect('');
                }
            }
        }

    }


    public function registration(){
        $this->data['username'] = $_POST['username'];

        if ( $_POST && isset($_POST['registration-btn']) ){

            $this->data['username'] = $_POST['username'];
            $this->data['surname'] = $_POST['surname'];
            $this->data['email'] = $_POST['email'];
            $this->data['phone'] = $_POST['phone'];
            $message = "";


            if( !$this->notNull($_POST) ) {
                $message .= "Должны быть заполнены все поля</br>";
            }
            if( $this->check('email', $_POST['email']) ){
                $message .= "Пользователь с такой почтой ( ".$_POST['email']. ") уже существует!</br>";
            }else{
                if( !$this->validateEmail($_POST['email']) ){
                    $message .= "Почта должна быть в таком формате user@mail.com</br>";

                }
            }
            if( !$this->equalPassword($_POST['password'], $_POST['r-password']) ){
                $message .= "Пароли не совпадают!</br>";
            }

            if( $this->check('phone', $_POST['phone']) ){
                $message .= "Пользователь с таким номером ( ".$_POST['phone']. ") уже существует!</br>";
            }else{
                if( !$this->validatePhone($_POST['phone']) ){
                    $message .= "Телефон должен быть в таком формате +30000000000</br>";
                }
            }
            $_POST['password'] = md5(Config::get('salt').$_POST['password']);
            if ( empty($message) ){
                $this->model->save($_POST);
                Router::redirect('');
            }else {
                Session::setFlash($message);
            }

            /*$hash = md5(Config::get('salt').$_POST['password']);
            if ( $user && $user['is_active'] && $hash == $user['password'] ){
                Session::set('login', $user['login']);
                Session::set('role', $user['role']);
            }
            Router::redirect();
            */
        }
    }
}