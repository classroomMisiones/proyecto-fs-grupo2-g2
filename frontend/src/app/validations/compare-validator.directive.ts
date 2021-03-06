import { Directive, Input } from '@angular/core';
import { ValidatorFn, ValidationErrors, AbstractControl, Validator, NG_VALIDATORS } from '@angular/forms';
import { Subscription } from 'rxjs';

export function compareValidator(controlNameToCompare: string | undefined): ValidatorFn {
  return (c: AbstractControl): ValidationErrors | null => {
    if (c.value === null || c.value.length === 0) {
      return null;
    }
    const controlToCompare = c.root.get(controlNameToCompare!);
    if (controlToCompare) {
      const subscription: Subscription = controlToCompare.valueChanges.subscribe(() =>{
        c.updateValueAndValidity();
        subscription.unsubscribe();
      });
    }
    return controlToCompare && controlToCompare.value !== c.value ? {'compare': true} : null;
  };
}

@Directive({
  selector: '[compare]',
  providers: [{provide: NG_VALIDATORS, useExisting: CompareValidatorDirective, multi: true }]
})
export class CompareValidatorDirective implements Validator {

  @Input('compare') controlNameToCompare?: string;

  validate(c: AbstractControl): ValidationErrors | null {
    return compareValidator(this.controlNameToCompare) (c);
  }

}


