/// This file contains https responses from konachan.net api

final responseCodeToMessage = {
  200: 'OK: Request was successful',
  403: 'Access denied',
  404: 'Not Found',
  420: 'Invalid Record: Record could not be saved',
  421: 'User Throttled: User is throttled, try again later',
  422: 'Locked: The resource if locked and cannot be modified',
  423: 'Already Exists: Resource already exists',
  424: 'Invalid Parameters: The given parameters were invalid',
  500: 'Internal Server Error: Some unknown error occurred on the server',
  503: 'Service Unavailable: Server cannot currently handle the request, try again later'
};
