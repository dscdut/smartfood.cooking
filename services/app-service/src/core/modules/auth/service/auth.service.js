import { pick } from 'lodash';
import { JwtPayload } from 'core/modules/auth/dto/jwt-sign.dto';
import { UserDataService } from 'core/modules/user/services/userData.service';
import { joinUserRoles } from 'core/utils/userFilter';
import { OAuthService } from './oauth.service';
import { BcryptService } from './bcrypt.service';
import { JwtService } from './jwt.service';
import { UserService } from '../../user/services/user.service';
import { UserRepository } from '../../user/user.repository';
import { UnAuthorizedException } from '../../../../packages/httpException';
import { CreateUserWithGoogleDto } from '../../user/dto';

class Service {
    constructor() {
        this.userRepository = UserRepository;
        this.jwtService = JwtService;
        this.bcryptService = BcryptService;
        this.userService = UserService;
        this.userDataService = UserDataService;
        this.oAuthService = OAuthService;
    }

    async login(loginDto) {
        const user = await this.userRepository.findByEmail(loginDto.email);

        const foundUser = joinUserRoles(user);
        if (user && this.bcryptService.compare(loginDto.password, foundUser.password)) {
            return {
                user: foundUser,
                accessToken: this.jwtService.sign(JwtPayload(foundUser)),
            };
        }

        throw new UnAuthorizedException('Email or password is incorrect');
    }

    #getUserInfo = user => pick(user, ['_id', 'email', 'username', 'roles']);

    async loginWithGoogle(token) {
        let userInfo;
        try {
            userInfo = await this.oAuthService.verify(token);
        } catch (error) {
            throw new UnAuthorizedException('Invalid token');
        }

        let user;
        const isUserExist = await this.userRepository.findByEmail(userInfo.email);

        if (isUserExist) {
            user = isUserExist;
        } else {
            user = await this.userService.createOneWithGoogleAccount(CreateUserWithGoogleDto(userInfo));
        }
        const accessToken = this.jwtService.sign({ email: userInfo.email, userId: user._id });
        return { email: userInfo.email, username: user.username, accessToken };
    }
}

export const AuthService = new Service();
