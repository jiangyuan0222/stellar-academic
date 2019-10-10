const jwt = require('jsonwebtoken');
const Status = require('http-status');
const i18n = require('i18n');
const SequelizeUsersRepository = require('src/infra/user/SequelizeUsersRepository');
const SequelizeSessionsRepository = require('src/infra/session/SequelizeSessionsRepository');
const {
    User: UserModel, Session: SessionModel,
    Family: FamilyModel,
    SchoolSubscriptionPlan: SchoolSubscriptionPlanModel
} = require('src/infra/database/models');
const usersRepository = new SequelizeUsersRepository({ UserModel });
const sessionsRepository = new SequelizeSessionsRepository({ SessionModel });

module.exports = async (req, res, next) => {
    if (req.headers.authorization) {
        try {
            let decoded = jwt.verify(req.headers.authorization, 'DigitalEducation');
            if (decoded) {
                let data = {
                    isAuthenticated: true,
                    value: decoded.data
                };
                let decodedData = decoded.data;

                switch (decodedData.user_type) {
                    case 'family':
                        const sessionData = await sessionsRepository._getByCondition({
                            where: {
                                user_id: decodedData.user_id,
                                user_type: decodedData.user_type,
                                token: decodedData.token
                            }
                        })

                        if (!sessionData) {
                            throw new Error();
                        }

                        const userData = await usersRepository._getByArgs({
                            attributes: [
                                "id",
                                "first_name",
                                "last_name",
                                "username",
                                "name",
                                "logo",
                                "email",
                                "phone",
                                "country_code",
                                "address",
                                "city",
                                "country",
                                "county",
                                "state",
                                "zip_code",
                                "user_type",
                                "status",
                                "subscription_plan_id",
                                "subscription_start_date",
                                "subscription_end_date",
                                "payment_due_date",
                                "is_payment_completed"
                            ],
                            include: [{
                                model: SchoolSubscriptionPlanModel,
                                as: 'subscription_plan'
                            }, {
                                model: FamilyModel,
                                as: 'family'
                            }],
                            where: {
                                id: decodedData.user_id,
                                user_type: decodedData.user_type
                            }
                        })

                        if (userData && userData.status === 'active') {
                            req.user = userData;
                            data.strategy = 'family';
                            req.auth = data;
                            next();
                        } else if (userData && userData.status === 'banned') {
                            res
                                .status(Status[410])
                                .json({
                                    message: i18n.__("common").bannedUser
                                });
                        } else {
                            throw new Error();
                        }

                        break;
                    case 'school_admin':
                        const schoolAdminSession = await sessionsRepository._getByCondition({
                            where: {
                                user_id: decodedData.user_id,
                                user_type: decodedData.user_type,
                                token: decodedData.token
                            }
                        })

                        if (!schoolAdminSession) {
                            throw new Error();
                        }

                        const school_admin = await usersRepository._getByArgs({
                            attributes: [
                                "id",
                                "first_name",
                                "last_name",
                                "username",
                                "name",
                                "logo",
                                "email",
                                'school_id',
                                "phone",
                                "country_code",
                                "address",
                                "city",
                                "country",
                                "county",
                                "state",
                                "zip_code",
                                "user_type",
                                "status",
                                "subscription_plan_id",
                                "subscription_start_date",
                                "subscription_end_date",
                                "payment_due_date",
                                "is_payment_completed",
                                "paypal_client_id",
                                "paypal_client_secret",
                                "registration_fee",
                                "enrollment_fee",
                                "graduation_fee",
                                "late_fee",
                                "other_standard",
                                "terms_days"
                            ],
                            include: [{
                                model: SchoolSubscriptionPlanModel,
                                as: 'subscription_plan'
                            }],
                            where: {
                                id: decodedData.user_id,
                                user_type: decodedData.user_type
                            }
                        })

                        if (school_admin && school_admin.status === 'active') {
                            req.user = school_admin;
                            data.strategy = 'school_admin';
                            req.auth = data;
                            next();
                        } else if (school_admin && school_admin.status === 'banned') {
                            res
                                .status(Status[410])
                                .json({
                                    message: i18n.__("common").bannedUser
                                });
                        } else {
                            throw new Error();
                        }
                        break;
                    case 'super_admin':
                        const adminSession = await sessionsRepository._getByCondition({
                            where: {
                                user_id: decodedData.user_id,
                                user_type: decodedData.user_type,
                                token: decodedData.token
                            }
                        })

                        if (!adminSession) {
                            throw new Error();
                        }

                        const super_admin = await usersRepository._getByCondition({
                            id: decodedData.user_id,
                            user_type: decodedData.user_type
                        })

                        if (super_admin && super_admin.status === 'active') {
                            req.user = super_admin;
                            data.strategy = 'super_admin';
                            req.auth = data;
                            next();
                        } else if (super_admin && super_admin.status === 'banned') {
                            res
                                .status(Status[410])
                                .json({
                                    message: i18n.__("common").bannedUser
                                });
                        } else {
                            throw new Error();
                        }
                        break;
                    case 'school_manager':
                        const schoolAdminManagerSession = await sessionsRepository._getByCondition({
                            where: {
                                user_id: decodedData.user_id,
                                user_type: decodedData.user_type,
                                token: decodedData.token
                            }
                        })
                        // console.log("must here");
                        // console.log(schoolAdminManagerSession);
                        if (!schoolAdminManagerSession) {
                            throw new Error();
                        }

                        const school_admin_manager = await usersRepository._getByArgs({
                            attributes: [
                                "id",
                                "first_name",
                                "last_name",
                                "username",
                                "name",
                                "logo",
                                "email",
                                'school_id',
                                "phone",
                                "country_code",
                                "address",
                                "city",
                                "country",
                                "county",
                                "state",
                                "zip_code",
                                "user_type",
                                "status",
                                "subscription_plan_id",
                                "subscription_start_date",
                                "subscription_end_date",
                                "payment_due_date",
                                "is_payment_completed",
                                "paypal_client_id",
                                "paypal_client_secret",
                                "registration_fee",
                                "enrollment_fee",
                                "graduation_fee",
                                "late_fee",
                                "other_standard",
                                "terms_days"
                            ],
                            include: [{
                                model: SchoolSubscriptionPlanModel,
                                as: 'subscription_plan'
                            }],
                            where: {
                                id: decodedData.user_id,
                                user_type: decodedData.user_type
                            }
                        })
                        
                        if (school_admin_manager && school_admin_manager.status === 'active') {
                            req.user = school_admin_manager;
                            data.strategy = 'school_manager';
                            req.auth = data;
                            next();
                        } else if (school_admin_manager && school_admin_manager.status === 'banned') {
                            res
                                .status(Status[410])
                                .json({
                                    message: i18n.__("common").bannedUser
                                });
                        } else {
                            throw new Error();
                        }
                        break;
                    case 'school_staff':
                        const schoolAdminStaffSession = await sessionsRepository._getByCondition({
                            where: {
                                user_id: decodedData.user_id,
                                user_type: decodedData.user_type,
                                token: decodedData.token
                            }
                        })
                        // console.log("must here");
                        // console.log(schoolAdminManagerSession);
                        if (!schoolAdminStaffSession) {
                            throw new Error();
                        }

                        const school_admin_staff = await usersRepository._getByArgs({
                            attributes: [
                                "id",
                                "first_name",
                                "last_name",
                                "username",
                                "name",
                                "logo",
                                "email",
                                'school_id',
                                "phone",
                                "country_code",
                                "address",
                                "city",
                                "country",
                                "county",
                                "state",
                                "zip_code",
                                "user_type",
                                "status",
                                "subscription_plan_id",
                                "subscription_start_date",
                                "subscription_end_date",
                                "payment_due_date",
                                "is_payment_completed",
                                "paypal_client_id",
                                "paypal_client_secret",
                                "registration_fee",
                                "enrollment_fee",
                                "graduation_fee",
                                "late_fee",
                                "other_standard",
                                "terms_days"
                            ],
                            include: [{
                                model: SchoolSubscriptionPlanModel,
                                as: 'subscription_plan'
                            }],
                            where: {
                                id: decodedData.user_id,
                                user_type: decodedData.user_type
                            }
                        })
                        
                        if (school_admin_staff && school_admin_staff.status === 'active') {
                            req.user = school_admin_staff;
                            data.strategy = 'school_staff';
                            req.auth = data;
                            next();
                        } else if (school_admin_staff && school_admin_staff.status === 'banned') {
                            res
                                .status(Status[410])
                                .json({
                                    message: i18n.__("common").bannedUser
                                });
                        } else {
                            throw new Error();
                        }
                        break;
                    default:
                        break;
                }
            } else {
                res
                    .status(Status.UNAUTHORIZED)
                    .json({
                        message: i18n.__("common").unAuth
                    });
            }
        } catch (error) {
            res
                .status(Status.UNAUTHORIZED)
                .json({
                    message: i18n.__("common").unAuth
                });
        }
    } else {
        let data = {
            isAuthenticated: false
        }
        req.auth = data
        next();
    }
}