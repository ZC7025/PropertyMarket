/**
 * 数据验证的通用方法
 * @param id 表单id
 */
function validate(id) {
    $(id).validationEngine({
        addPromptClass:'formError-white',
        autoHidePrompt:'true',
        autoHideDelay:10000,
        fadeDuration:0.3,
        promptPosition:'topRight',
        maxErrorsPerField:1,
        ajaxFormValidation:'true',
        ajaxFormValidationMethod:'post'
    })
}