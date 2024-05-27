package edu.kh.mind.member.social.google;

import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.oauth.OAuth20Service;
import edu.kh.mind.member.social.kakao.KakaoLoginApi;

import javax.servlet.http.HttpSession;
import java.util.UUID;

public class GoogleLoginBO {
    // 카카오 로그인 정보
    private final static String GOOGLE_CLIENT_ID = "b862240d0cf0e40922fb9312954ca3a2";
    private final static String GOOGLE_CLIENT_SECRET = "gdtGzCb853IUDKEcrizvc2z67kcyTGhY";
    private final static String GOOGLE_REDIRECT_URI = "/mind/social/kakaoCallback";
    private final static String SESSION_STATE = "kakao_oauth_state";

//    private final static String SESSION_STATE = "kakao_oauth_state";
//    private final static String PROFILE_API_URL = "https://kapi.kakao.com/v2/user/me";

    public String getAuthorizationUrl(HttpSession session, String serverUrl) {

        String state = generateRandomString();

        setSession(session, state);

        OAuth20Service oauthService = new ServiceBuilder()
                .apiKey(GOOGLE_CLIENT_ID)
                .apiSecret(GOOGLE_CLIENT_SECRET)
                .callback(serverUrl + GOOGLE_REDIRECT_URI)
                .state(state)
                .build(KakaoLoginApi.instance());

        return oauthService.getAuthorizationUrl();
    }

    /* 세션 유효성 검증을 위한 난수 생성기 */
    private String generateRandomString() {
        return UUID.randomUUID().toString();
    }
    private void setSession(HttpSession session, String state) {
        session.setAttribute(SESSION_STATE, state);
    }
    private String getSession(HttpSession session) {
        return (String) session.getAttribute(SESSION_STATE);
    }
}
