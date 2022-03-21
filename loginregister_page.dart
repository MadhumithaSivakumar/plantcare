import 'package:flutter/material.dart';
import 'authentication.dart';


class LoginRegisterPage extends StatefulWidget
{
    LoginRegisterPage
    ({
         required this.auth,
         required this.onSignedIn,
    });

    final AuthImplementation auth;
    final VoidCallback onSignedIn;

    //const LoginRegisterPage({Key? key}) : super(key: key);
    State<StatefulWidget> createState()
   {
      return _LoginRegisterState();
   }
}

enum FormType
{
  login,
  register
}

class _LoginRegisterState extends State<LoginRegisterPage>
{
  final formKey = new GlobalKey<FormState>();
  FormType formType = FormType.login;
   String email=" ";
   String password=" ";
  //methods
  bool validateAndSave()
  {
     final form = formKey.currentState;
     if(form!.validate())
     {
       form.save();
       return true;
     }
     else
     {
       return false;
     }
  }
  void validateAndSubmit() async
  {
      if(validateAndSave())
      {
        try
        {
          if(formType == FormType.login)
          {
              String userId = await widget.auth.SignIn(email,password);
              print("login userId = " + userId);
          }
          else
          {
              String userId = await widget.auth.SignUp(email,password);
              print("Register userId = " + userId);
          }
          
          widget.onSignedIn();
        }
        catch(e)
        {
           print("Error = " + e.toString());
        }
      }
  }
  void moveToRegister()
  {
       formKey.currentState!.reset();
       setState(()
       {
         formType = FormType.register;
       });
  }
  void moveToLogin()
  {
       formKey.currentState!.reset();
       setState(()
       {
         formType = FormType.login;
       });
  }
  //Design
  @override
  Widget build(BuildContext context)
  {
    return  Scaffold
    (
      appBar: AppBar
      (
        title: const Text("Flutter Blog app"),
      ),
      body: Container
      (
        margin: EdgeInsets.all(15.0),

        child:  Form
        (
          key: formKey,
          child: Column
          (
             crossAxisAlignment: CrossAxisAlignment.stretch,
             children: createInputs() + createButtons(),
          ),
        ),
      ),
         
      
    );
  }




  List<Widget> createInputs()
  {
    return
    [
       SizedBox(height: 10.0,),
       logo(),
       SizedBox(height: 20.0,),

       // ignore: unnecessary_new
       new  TextFormField
       (
         decoration: new  InputDecoration(labelText: 'Email'),

         validator: (value)
         {
              return value!.isEmpty ? 'Email is required.' : null;
         },
         
         onSaved: (value)
         {
               // ignore: void_checks
                email = value!;

         },
       ),
       SizedBox(height: 10.0,),
       
       new TextFormField
       (
         decoration: new InputDecoration(labelText: 'Password'),
         obscureText:  true,
          validator: (value)
         {
              return value!.isEmpty ? 'Password is required.' : null;
         },
         
         onSaved: (value)
         {
               // ignore: void_checks
               password = value!;

         },
       ),
       SizedBox(height: 20.0,),
    ];
  }

  Widget logo()
  {
    return new Hero
    (
      tag: 'hero',
      child: new CircleAvatar
      (
        backgroundColor: Colors.transparent,
        radius:  110.0,
        child: Image.asset('images/plant.png')
      )
    );
  }

  List<Widget> createButtons()
  {
    if(formType == FormType.login)
    {
      return
      [
        new RaisedButton
       (
        child: new Text("Login", style: new TextStyle(fontSize: 20.0)),
        textColor: Colors.white,
        color: Colors.green,
        onPressed: validateAndSubmit,
       ),
        new FlatButton
        (
        child: new Text("Not have an Account?Create Account", style: new TextStyle(fontSize: 14.0)),
        textColor: Colors.green,
        onPressed: moveToRegister,
        ),
     ];
    }
    else
    {
      return
      [
        new RaisedButton
       (
        child: new Text("Create Account", style: new TextStyle(fontSize: 20.0)),
        textColor: Colors.white,
        color: Colors.green,
        onPressed: validateAndSubmit,
       ),
        new FlatButton
        (
        child: new Text("Already have an Account?Login", style: new TextStyle(fontSize: 14.0)),
        textColor: Colors.green,
        onPressed: moveToLogin,
        ),
     ];
    }
  }
}