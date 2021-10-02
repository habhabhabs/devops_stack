CREATE DATABASE kiwi CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'kiwidba'@'%' IDENTIFIED BY '9AkWXk4JFBR7xG';
GRANT ALL PRIVILEGES ON kiwi.* TO 'kiwidba'@'%';

CREATE DATABASE gitea CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'giteadba'@'%' IDENTIFIED BY 'DK8BVGaLfEvQOe';
GRANT ALL PRIVILEGES ON gitea.* TO 'giteadba'@'%';

CREATE DATABASE keycloak CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
CREATE USER 'keycloakdba'@'%' IDENTIFIED BY 'rxBhGqZq1LQg7U';
GRANT ALL PRIVILEGES ON keycloak.* TO 'keycloakdba'@'%';