# Домашнее задание к занятию «Управляющие конструкции в коде Terraform»

## Задание 1
- Изучите проект.
- Инициализируйте проект, выполните код.
- Приложите скриншот входящих правил «Группы безопасности» в ЛК Yandex Cloud .
<img width="613" height="281" alt="image" src="https://github.com/user-attachments/assets/646c3eb5-072c-40bd-abef-ef0a9f5e1897" />


## Задание 2
- Создайте файл count-vm.tf. Опишите в нём создание двух одинаковых ВМ web-1 и web-2 (не web-0 и web-1) с минимальными параметрами, используя мета-аргумент count loop.
- Назначьте ВМ созданную в первом задании группу безопасности.(как это сделать узнайте в документации провайдера yandex/compute_instance )
<img width="672" height="148" alt="image" src="https://github.com/user-attachments/assets/1d9f15a1-28bd-40cc-9064-36c87e0f8f03" />

- Создайте файл for_each-vm.tf. Опишите в нём создание двух ВМ для баз данных с именами "main" и "replica" разных по cpu/ram/disk_volume , используя мета-аргумент for_each loop.
<img width="850" height="365" alt="image" src="https://github.com/user-attachments/assets/b7c19952-7c11-408d-92bd-649ad456960c" />

- ВМ, описанные в файле count-vm.tf, должны создаваться после ВМ, описанных в файле for_each-vm.tf.
<img width="435" height="72" alt="image" src="https://github.com/user-attachments/assets/a5da4c7c-4e27-47a0-a849-2392876e82fe" />
  
- Используйте функцию file в local-переменной для считывания ключа ~/.ssh/id_rsa.pub и его последующего использования в блоке metadata, взятому из ДЗ 2.
<img width="618" height="233" alt="image" src="https://github.com/user-attachments/assets/9cc52473-3012-434f-ad2b-a2a8d86fe7d8" />

- Инициализируйте проект, выполните код.
<img width="1251" height="297" alt="image" src="https://github.com/user-attachments/assets/b5b5dfae-1a3a-4e8d-838d-1204e3a46da3" />


## Задание 3
- Создайте 3 одинаковых виртуальных диска размером 1 Гб с помощью ресурса yandex_compute_disk и мета-аргумента count в файле disk_vm.tf .
- Создайте в том же файле одиночную(использовать count или for_each запрещено из-за задания №4) ВМ c именем "storage" . Используйте блок dynamic secondary_disk{..} и мета-аргумент for_each для подключения созданных вами дополнительных дисков.
<img width="554" height="461" alt="image" src="https://github.com/user-attachments/assets/b00323a0-dfad-4fdf-b2e7-7b91b6a01c8e" />
<img width="779" height="448" alt="image" src="https://github.com/user-attachments/assets/bda2bf29-8616-4347-af72-9e77093aedc5" />
<img width="1085" height="36" alt="image" src="https://github.com/user-attachments/assets/5d1df219-4bdf-4144-a723-b7578dcfadbb" />
<img width="956" height="288" alt="image" src="https://github.com/user-attachments/assets/aea6151b-65c9-423d-adce-028202ff8381" />

  
