module.exports = {
    strategies: {
        Family: 'family',
        SchoolAdmin: 'school_admin',
        SuperAdmin: 'super_admin',
        SchoolManager: 'school_manager',
        SchoolStaff: 'school_staff'
    },
    check: (req, next, data) => {
        if (req.auth) {
            let index = data.findIndex(strategy => strategy === req.auth.strategy)

            if (index > -1)
                next(true);
            else
                next(false);
        }
        else {
            next(false);
        }
    }
}