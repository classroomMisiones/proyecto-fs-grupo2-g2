import { Component, OnInit, Renderer2 } from '@angular/core';
import { FormControl, Validators, FormGroup } from '@angular/forms'

import { compareValidator } from 'src/app/validations/compare-validator.directive';
import { passwordValidation } from 'src/app/validations/password-validations.directive';

import Aos from 'aos';

@Component({
  selector: 'app-registro',
  templateUrl: './registro.component.html',
  styleUrls: ['./registro.component.css']
})
export class RegistroComponent implements OnInit {

   emailPattern: any = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

   telefPattern: any = /^([+]?[\s0-9]+)?(\d{3}|[(]?[0-9]+[)])?([-]?[\s]?[0-9])+$/;

  createFormGroup() {
    return new FormGroup ({
      nombre: new FormControl('',[Validators.required, Validators.minLength(5)]),
      email: new FormControl('',[Validators.required, Validators.pattern(this.emailPattern)]),
      password: new FormControl('',[Validators.required, Validators.minLength(8),passwordValidation()]),
      repitPassword: new FormControl('',[Validators.required, compareValidator('password')]),
    });
  }

  registroForm: FormGroup;

  constructor(private render: Renderer2) {
    this.registroForm = this.createFormGroup();
   }

  ngOnInit(): void {

    const elment = document.getElementById('registro-wrap');
    const obj = elment?.getBoundingClientRect();
    const height = obj?.height!;

    console.log('height registro-wrap '+height );

    const elment1 = document.getElementById('pageRegistro');
    const obj1 = elment1?.getBoundingClientRect();
    const height1 = obj1?.height!;

    console.log('pageRegistro '+height1 );

    Aos.init();

    // const imagenCarrusel = document.getElementsByClassName('claseImagenCarrusel');
    // const carrusel = document.getElementById('carousel');
    // this.render.addClass(carrusel,'dark');
    // for (var i = 0; i < imagenCarrusel.length; i++) {
    //   this.render.setStyle(imagenCarrusel[i],'height','100vh');
    // }
  }

  onRegister() {
    if (this.registroForm.valid) {
        console.log('saved form');
    }
  }

  agregaError() {
    const contact = document.getElementById('registro-wrap');
    const page = document.getElementById('pageRegistro');
    const imagenFondo = document.getElementById('imagenFondo');
    const obj = contact?.getBoundingClientRect();
    let heightContact = obj?.height! + 10;

    heightContact = (heightContact > 640 ? heightContact : 640);
    this.render.setStyle(page,'height',`${heightContact}px`);
    const heightImagen = heightContact + 125;
    this.render.setStyle(imagenFondo,'height',`${heightImagen}px`);

    const topFooter = heightImagen - 50;
    const footer = document.getElementById('footer');
    // this.render.setStyle(footer,'bottom','10px');
    this.render.setStyle(footer,'top',`${topFooter}px`);

    return true;
  }

  get nombre() { return this.registroForm.get('nombre'); }
  get email() { return this.registroForm.get('email'); }
  get password() { return this.registroForm.get('password'); }
  get repitPassword() { return this.registroForm.get('repitPassword'); }

}
