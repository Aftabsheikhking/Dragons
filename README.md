![1000119095](https://github.com/user-attachments/assets/4030b478-3853-45ff-9220-966d40ff9c06)
flowchart TD
    START([START]) --> DEVICE[Device Detection<br/>Android/Windows/Linux]
    DEVICE --> LOAD[Load Cookies from File]
    LOAD --> PREPROCESS[Preprocess Cookies<br/>extract: fb_dtsg, lsd, actor_id, jazoest]
    PREPROCESS --> PRELOGIN[Pre-login System<br/>Validate sessions in parallel]
    PRELOGIN --> INPUT[Get User Inputs<br/>- Comment text<br/>- Emoji on/off<br/>- Target count<br/>- Mode 1/2<br/>- Comment type 1/2/3<br/>- Post ID/Link]
    INPUT --> ACTORS[Get Available Actors<br/>Profile ID / Pages]
    ACTORS --> MODE{Mode Selection}
    
    MODE -->|Mode 1| NORMAL[NORMAL MODE<br/>- Distribute evenly<br/>- Random shuffle<br/>- ThreadPoolExecutor]
    MODE -->|Mode 2| RCSPEED[RC SPEED MODE<br/>- Parallel per account<br/>- No delays<br/>- MAX SPEED]
    
    NORMAL --> LOOP
    RCSPEED --> LOOP
    
    LOOP[FOR EACH COMMENT] --> TOKEN{Token Available?}
    
    TOKEN -->|YES| TOKEN_METHODS[Token Methods]
    TOKEN_METHODS --> WEB[Web GraphQL<br/>doc_id: 7391620150945935]
    WEB -->|Fail| API[Graph API<br/>v18.0/comments]
    API --> RESULT
    
    TOKEN -->|NO| COOKIE_ONLY[Cookie-Only Method]
    COOKIE_ONLY --> DIRECT[Direct GraphQL Mutation<br/>doc_id: 6379115828844234]
    DIRECT --> FALLBACK[Fallback Method]
    FALLBACK --> RESULT
    
    RESULT{Success/Failure?}
    
    RESULT -->|SUCCESS| SUCCESS_BOX[✓ SUCCESS<br/>- Increment counter<br/>- Log method used<br/>- Update progress]
    RESULT -->|FAILURE| FAIL_BOX[✗ FAILURE<br/>- Log error<br/>- Mark cookie blocked<br/>- Skip this cookie]
    
    SUCCESS_BOX --> STATS
    FAIL_BOX --> STATS
    
    STATS[Show Statistics<br/>- Success/Fail/Blocked<br/>- Speed comments/min<br/>- Fallback stats<br/>- Time elapsed]
    
    STATS --> NEXT{Ask for Next Round}
    
    NEXT -->|ENTER| LOOP
    NEXT -->|n| INPUT
    NEXT -->|s| STATS
    NEXT -->|q| END([END / EXIT])
    
    style START fill:#fff,stroke:#333,stroke-width:2px
    style END fill:#fff,stroke:#333,stroke-width:2px
    style SUCCESS_BOX fill:#90EE90,stroke:#333,stroke-width:2px
    style FAIL_BOX fill:#FFB6C1,stroke:#333,stroke-width:2px
    style TOKEN fill:#FFD700,stroke:#333,stroke-width:2px
    style MODE fill:#FFD700,stroke:#333,stroke-width:2px
    style NEXT fill:#FFD700,stroke:#333,stroke-width:2px
    style RESULT fill:#FFD700,stroke:#333,stroke-width:2px
